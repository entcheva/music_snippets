import React from 'react';
import { Route, IndexRoute } from 'react-router';
import User from './User';
import Snippet from './Snippet';


export default (
  <Route path="/signup" component={ User }>
    <IndexRoute component={ Snippet } />
  </Route>
)
