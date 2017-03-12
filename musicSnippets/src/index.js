import React from 'react';
import ReactDOM from 'react-dom';

import { Provider } from 'react-redux';
import { createStore } from 'redux';


import App from './App';
import './index.css';

const store = createStore(rootReducer);

ReactDOM.render(
  <Provider store={store}>
  <App />,
  document.getElementById('root')
  </Provider>
);
