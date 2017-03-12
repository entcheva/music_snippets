import axios from 'axios';
import { browserHistory } from 'react-router';

axios.defaults.baseURL = "http://localhost:3000/api/v1";

axios.defaults.headers.common['AUTHORIZATION'] = sessionStorage.getItem('jwt')

export const createUser = (user) => {

  let response = axios.post(URL + '/users', user)

  .then( (userData) => {
    sessionStorage.setItem( {jwt: userData.data.jwt} );
    browserHistory.push('/users');
    return userData;
  });

  return {
    type: 'SIGN_UP',
    payload: response
  }
}
