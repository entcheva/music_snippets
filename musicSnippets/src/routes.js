import React from 'react';
import { Route, IndexRoute } from 'react-router';
import App from './App';
import Home from './Home';
import User from './User';
import Snippet from './Snippet';


export default (
  <Route path="/" component={App}>
    <IndexRoute component={Home} />
    <Route path="/signup" component={User} />
    <Route path="/snippets" component={Snippet} />
  </Route>
)
