import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { createUser } from './actions';

class User extends Component {

  constructor() {
    super();
    this.handleSignUp = this.handleSignUp.bind(this);
    this.handleLogIn = this.handleLogIn.bind(this);
  }

  handleSignUp() {
    event.preventDefault();
    let username = this.refs.username.value;
    let email = this.refs.email.value;
    let password = this.refs.password.value;
    let passwordConfirmation = this.refs.passwordConfirmation.value;
    let user = { username: username, email: email, password: password, password_confirmation: passwordConfirmation };
    this.props.createUser(user);
  }

  handleLogIn() {
    event.preventDefault();
  }

  render() {
    return (
      <div>

        <div id="signUpForm">
          <h2>Sign Up</h2>
          <form onSubmit={ this.handleSignUp } >
            <label>Username: </label>
            <input ref="username" placeholder="Enter Username" required />
            <br/><br/>
            <label>Email: </label>
            <input type="email" ref="email" placeholder="Enter Email" required />
            <br/><br/>
            <label>Password: </label>
            <input type="password" ref="password" placeholder="Enter Password" required />
            <br/><br/>
            <label>Confirm Password: </label>
            <input type="password" ref="passwordConfirmation" placeholder="Confirm Password" required />
            <br/><br/>
            <button type="submit">Sign Up</button>
          </form>
        </div>

        <div id="logInForm">
          <h2>Log In</h2>
          <form onSubmit={ this.handleLogIn }>
            <label>Email: </label>
            <input ref="logInEmail" placeholder="Enter Email" />
            <br/><br/>
            <label>Password: </label>
            <input type="password" ref="logInPassword" placeholder="Enter Password"/>
            <br/><br/>
            <button type="submit">Log In</button>
          </form>
        </div>

      </div>
    );
  }
}

const mapStateToProps = (state) => {
  return {
    user: state.user,
  }
}

const mapDispatchToProps = (dispatch) => {
  return bindActionCreators( { createUser }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(User);
