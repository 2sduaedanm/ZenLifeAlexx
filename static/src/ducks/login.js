import { createReducer } from 'redux-act';
import { createAction } from 'redux-act';
import { TokenAPI } from '../services';
// import { requestProgression } from './progression';

export const REDUCER = 'login';
const NS = `@@${REDUCER}/`;

export const setToken = createAction(`${NS}SET_TOKEN`);

const TokenApi = new TokenAPI();

export const requestLogin = (username, password ) => (dispatch, getState) => {
  return TokenApi.getToken({username, password })
    .then(response => {
      // dispatch(setToken(response.data));
      localStorage.setItem('token', response.data.token);
      return true;
    })
    .catch(error => {
      return error.response.data;
    });
};

const initialState = {
  token: "",
};

export default createReducer(
  {
    [setToken]: (state, token) => ({ ...state, token }),
  },
  initialState,
);