import { createReducer } from 'redux-act';
import { createAction } from 'redux-act';
import { TokenAPI } from '../services';
import Popup from "reactjs-popup";
// import { NotificationContainer, NotificationManager } from 'react-notifications';
export const REDUCER = 'profile';
const NS = `@@${REDUCER}/`;

export const setProfileData = createAction(`${NS}SET_PROFILE_DATA`);

const TokenApi = new TokenAPI();

// const Modal =  () => (
//     <Popup
//         trigger={<button className="button"> Open Modal </button>}
//         modal
//         closeOnDocumentClick
//     >
//         <span> Modal content </span>
//     </Popup>
// );

export const getProfileData = () => (dispatch, getState) => {
  return TokenApi.getProfileData()
    .then(response => {
      dispatch(setProfileData(response.data));
      // console.log(response.data.user.student);
      // console.log(response.data.user.instructor);
      if (response.data && response.data) {
          // console.log(response.data.user);
          if (response.data.user.instructor && response.data.user.management) {
              console.log('what to do [admin or front]');
              // NotificationManager.info('You have access to admin part of App: ');
          }
          if (response.data.user.instructor && !response.data.user.management) {
              return true;
          }
          if (!response.data.user.instructor && response.data.user.management) {
              localStorage.removeItem('token');
              window.location.replace(process.env.REACT_APP_MEDIA_SERVER);
              // NotificationManager.info('You have access to admin part of App: ');
          }
      }
      return true;
    })
    .catch(error => {
      return error.response.data;
    });
};

const initialState = {
  profileData: {},
};

export default createReducer(
  {
    [setProfileData]: (state, profileData) => ({ ...state, profileData }),
  },
  initialState,
);