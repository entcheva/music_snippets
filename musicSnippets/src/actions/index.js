import axios from 'axios';
import { browserHistory } from 'react-router';

axios.defaults.baseURL = "http://localhost:3000/api/v1";
axios.defaults.headers.common['AUTHORIZATION'] = sessionStorage.getItem('jwt')

export const createUser = (user) => {
  const response = axios.post(URL + '/users', user).then( (userData) => {
    sessionStorage.setItem( {jwt: userData.data.jwt} );
    browserHistory.push('/snippets');
    return userData;
  });

  return {
    type: 'SIGN_UP',
    payload: response
  }
};

export const fetchUsername = () => {
  axios.defaults.headers.common['AUTHORIZATION'] = sessionStorage.getItem('jwt')
  const response = axios.get('/active')
  return {
    type: 'FETCH_USERNAME',
    payload: response
  }
};
