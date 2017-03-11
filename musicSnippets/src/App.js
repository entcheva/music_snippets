import React, { Component } from 'react';
// import logo from './logo.svg';
import './App.css';
import User from './User';
import Snippet from './Snippet';


export default class App extends Component {
  render() {
    return (
      <div className="App">
        <User />
        <Snippet />
      </div>
    );
  }
}
