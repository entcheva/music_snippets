import { combineReducers } from 'redux';
import usersReducer from './usersReducer';
import snippetsReducer from './snippetsReducer';

const rootReducer = combineReducers(
  {
    user: usersReducer,
    snippets: snippetsReducer,
  }
);

export default rootReducer;
