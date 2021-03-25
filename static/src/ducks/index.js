import { combineReducers } from 'redux';
import { routerReducer } from 'react-router-redux';
import { pendingTasksReducer } from 'react-redux-spinner';
import progression from './progression';
import login from './login';
import profile from './profile';

export default combineReducers({
  routing: routerReducer,
  pendingTasks: pendingTasksReducer,
  progression,
  login,
  profile
});