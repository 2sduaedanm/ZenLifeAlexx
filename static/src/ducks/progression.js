import axios from 'axios';
import { createReducer } from 'redux-act';
import { createAction } from 'redux-act';
import { ProgressionAPI, TokenAPI, StudentAPI} from '../services';

export const REDUCER = 'progression';
const NS = `@@${REDUCER}/`;

export const setProgressionList = createAction(`${NS}SET_PROGRESSION_LIST`);
export const setSearchContent = createAction(`${NS}SET_SEARCH_CONTENT`);
export const setPageKey = createAction(`${NS}SET_PAGE_KEY`);
export const setChallengeDetails = createAction(`${NS}SET_CHALLENGE_DETAILS`);
export const setProgression = createAction(`${NS}SET_PROGRESSION`);
export const setStudents = createAction(`${NS}SET_STUDENTS`);
export const setCurriculum = createAction(`${NS}SET_CURRICULUM`);
export const setChallenge = createAction(`${NS}SET_CHALLENGE`);
export const setUploadProgress = createAction(`${NS}SET_UPLOAD_PROGRESS`);

const ProgressionApi = new ProgressionAPI();
const TokenApi = new TokenAPI();
const StudentApi = new StudentAPI();

export const requestProgression = (pageId) => (dispatch, getState) => {

  return ProgressionApi.getProgression()
    .then(response => {
      if (pageId){
        dispatch(setProgression(response.data.filter(item => item.id == pageId)[0].short));
      }else{
        dispatch(setSearchContent(response.data));
      }
      return true;
    })
    .catch(error => {
      return false;
    });
};


export const requestStudentsList = (id, doNotUpdateProgression, pageId) => (dispatch, getState) => {
    return ProgressionApi.requestStudentsList(id)
    .then(response => {
      if (pageId){
        dispatch(setStudents(response.data.filter(item => item.id == pageId)[0].full_name));
      }else if(!doNotUpdateProgression){
          console.log(1111)
        const currentProgression = getState().progression.searchContent.filter(item => item.id == id)[0];

        const currentString = currentProgression? currentProgression.short : '';

        if (currentProgression){
          dispatch(setProgression(currentString));
        }

        dispatch(setSearchContent(response.data));
      } else {
          dispatch(setSearchContent(response.data));
      }
      return true;
    })
    .catch(error => {
      console.log(error);
      return false;
    });
};

export const requestCurriculum = (progressionId,studentsId,pageId ) => (dispatch, getState) => {
  return ProgressionApi.requestCurriculum(progressionId,studentsId)
    .then(response => {
      if (pageId){
        dispatch(setCurriculum(response.data.filter(item => item.id == pageId)[0].short));
      }else{
        const currentStudent = getState().progression.searchContent.filter(item => item.id == studentsId)[0];

        dispatch(setSearchContent(response.data));
        const currentString = currentStudent? currentStudent.full_name : '';
        if (currentString){
          dispatch(setStudents(currentString))
        }
        dispatch(setSearchContent(response.data));
      }
      return true;
    })
    .catch(error => {
      console.log(error);
      return false;
    });
};

export const requestChallenge = (studentsId, progressionId, curriculumId, pageId) => (dispatch, getState) => {

  return ProgressionApi.requestChallenge(studentsId, progressionId, curriculumId)
    .then(response => {
      if (pageId){
        let  chalangeName = "";
        response.data.forEach(item=>{
          item.challenges.forEach(chalange=>{
            if (parseInt(chalange.id) === parseInt(pageId)){
              chalangeName = chalange.short;
            }
          })
        });
        dispatch(setChallenge(chalangeName));

        // dispatch(setChallenge(response.data.filter(item => item.id == pageId)[0].short));
      }else{
        const currentCurriculum = getState().progression.searchContent.filter(item => item.id == curriculumId)[0];

        const currentString = currentCurriculum? currentCurriculum.short : '';
        if (currentString){
          dispatch(setCurriculum(currentString))

        }
        dispatch(setSearchContent(response.data));

      }
      return true;
    })
    .catch(error => {
      console.log(error);
      return false;
    });
};

export const updateStudentPhoto = (file, studentId) => (dispatch, getState) => {
    const fd = new FormData();
    fd.set('file', file)
    return StudentApi.updatePhoto(studentId, fd)
}

export const requestChallengeDetails = (studentsId, challengeId,  pageId ) => (dispatch, getState) => {

  return ProgressionApi.requestChallengeDetails(studentsId, challengeId )
    .then(response => {
      if (pageId){
        dispatch(setChallenge(response.data.filter(item => item.id == pageId)[0].short));
      }else{
        const currentChallenge = getState().progression.searchContent.filter(item => item.id == challengeId)[0];

        const currentString = currentChallenge? currentChallenge.short : '';
        if (currentString){
          dispatch(setChallenge(currentString))

        }
        dispatch(setChallengeDetails(response.data));
      }
      return true;
    })
    .catch(error => {
      console.log(error);
      return false;
    });
};

export const updateChallengeStatus = (challenge_id,student_id, passed, instructed, instructor) => (dispatch, getState) => {
  return ProgressionApi.updateChallengeStatus( {challenge_id,student_id, passed, instructed, instructor})
    .then(response => {
      if (response.data.success=== true){
        let currentChallenge = {...getState().progression.challengeDetails};
        currentChallenge.ext.status = passed === 1 ? "Passed" : "Instructed";
        dispatch(setChallengeDetails(currentChallenge));
      }
      return true;
    })
    .catch(error => {
      console.log(error);
      return false;
    });
};


export const requestChallengesTypes = () => (dispatch, getState) => {
  return ProgressionApi.requestChallengesTypes()
    .then(response => {
      // dispatch(setSearchContent(response.data));

      return true;
    })
    .catch(error => {
      console.log(error);
      return false;
    });
};

export const uploadVideoS3 = (pageId, challengeId, curriculumId, progressionId, studentsId, file) => (dispatch, getState) => {
  return TokenApi.getProfileData()
    .then(response => {
      const instructorId = response.data.user.id
    const fileName = file.name
    const fileType = file.type
    return ProgressionApi.getVideoEndpoint({challengeId, curriculumId, progressionId, studentsId, instructorId, fileName})
      .then( response => {
        let data = response.data.data.upload.fields
        const url = response.data.data.upload.url + '/' + data.key
        const newFileName = data.key
        const options = {
          headers: {
            'content-type': 'multipart/form-data',
          },
          onUploadProgress: (ev) => {
            const percent = parseInt(ev.loaded / ev.total * 100)
            dispatch(setUploadProgress(percent));
          }
        }
        for ( let k in data) {
          options.headers[k] = data[k]
        }
        return ProgressionApi.uploadVideoS3(url, file, options)
          .then( () => {
            const updateData = {
              instructor_id: instructorId,
              challenge_id : challengeId,
              student_id : studentsId,
              vurl : newFileName
            }
            return ProgressionApi.updateVideoLink(updateData)
              .then( response => {
                dispatch(setUploadProgress(0));
                return true
              }).catch(error => {
                console.log(error);
                return false;
              });
          }).catch(error => {
            console.log(error);
            return false;
          });
      }).catch(error => {
        console.log(error);
        return false;
      });
    }).catch(error => {
      console.log(error);
      return false;
    });

}

const initialState = {
  progressionList: [],
  searchContent: [],
  pageKey: [],
  challengeDetails:{},
  progression:'',
  students: '',
  curriculum: '',
  challenge: '',
  s3credentials: {}
};

export default createReducer(
  {
    [setProgressionList]: (state, progressionList) => ({ ...state, progressionList }),
    [setChallengeDetails]: (state, challengeDetails) => ({ ...state, challengeDetails }),
    [setSearchContent]: (state, searchContent) => ({ ...state, searchContent }),
    [setPageKey]: (state, pageKey) => ({ ...state, pageKey }),
    [setProgression]: (state, progression) => ({ ...state, progression }),
    [setStudents]: (state, students) => ({ ...state, students }),
    [setCurriculum]: (state, curriculum) => ({ ...state, curriculum }),
    [setChallenge]: (state, challenge) => ({ ...state, challenge }),
    [setUploadProgress] : (state, uploadProgress) => ({ ...state, uploadProgress }),
  },
  initialState,
);