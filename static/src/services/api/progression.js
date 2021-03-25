import HttpClient from './api';

class ProgressionAPI extends HttpClient {
  getProgression() {
    return this.doGet(`/getProgressionList/`);
  }

  requestStudentsList(id) {
    return this.doGet(`/getStudentListExtended/${id}/`);
  }

  requestCurriculum(progressionId,studentsId) {
    return this.doGet(`/getStudentCurriculumList/${progressionId}/${studentsId}/`);
  }
  requestChallenge(progressionId,studentsId, passed ) {
    return this.doGet(`/getChallengesByStudentsCurriculumList/${progressionId}/${studentsId}/${passed? `${passed}/` : ''}`);
  }

  requestChallengesTypes() {
    return this.doGet(`/getChallengeTypeList/`);
  }
  requestChallengeDetails(studentsId, challengeId ) {
    return this.doGet(`/progression_students/${studentsId}/${challengeId}/`);
  }
  updateChallengeStatus(data) {
    return this.doPost(`/update_challenge_status/`, data);
  }

  getVideoEndpoint(data) {
    return this.doGet(`/sign_s3_upload/${data.fileName}/${data.instructorId}/${data.studentsId}/${data.curriculumId}/${data.challengeId}/${data.progressionId}/`);
  }

  uploadVideoS3(signedUrl, data, options) {
    return this.doS3upload(signedUrl, data, options);
  }

  updateVideoLink(data) {
    return this.doPost('update_student_challenge_video_url/', data)
  }

}

export default ProgressionAPI;