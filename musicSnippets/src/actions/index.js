import axios from 'axios';
import { browserHistory } from 'react-router';

const BASE_URL = "http://localhost:3000/api/v1";

axios.defaults.baseURL = "http://localhost:3000/api/v1";
axios.defaults.headers.common['AUTHORIZATION'] = sessionStorage.getItem('jwt')

export const createUser = (user) => {
  axios.defaults.headers.common['AUTHORIZATION'] = sessionStorage.getItem('jwt')
  const response = axios.post(BASE_URL + '/signup', user).then( (userData) => {
    sessionStorage.setItem( {jwt: userData.data.jwt} );
    browserHistory.push('/users');
    return userData;
  });

  return {
    type: 'SIGN_UP',
    payload: response
  }
}


// export const fetchUsername = () => {
//   const response = axios.get('/active')
//
//   return {
//     type: 'FETCH_USERNAME',
//     payload: response
//   }
// }


export const createSnippet = (snippet) => {
  axios.defaults.headers.common['AUTHORIZATION'] = sessionStorage.getItem('jwt')
  const response = axios.post(BASE_URL + '/create', snippet).then( (snippetData) => {
    sessionStorage.setItem( {jwt: snippetData.data.jwt} );
    browserHistory.push('/snippets');
    return snippetData;
  });

  return {
    type: 'CREATE_SNIPPET',
    payload: response
  }







}
