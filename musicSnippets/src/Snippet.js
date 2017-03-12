import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { fetchUsername } from './actions';

class Snippet extends Component {

  // constructor() {
  // 	super();
  // }

  componentDidMount() {
    // this.props.fetchUsername()
  }



  render() {
    return (
      <div>
        <h1>Hi from the Snippet component</h1>
        <h3>Welcome</h3>
        <h3>My snippets:</h3>
      </div>
    );
  }
}

const mapStateToProps = (state) => {
  return {
    username: state.user.username
  }
}

const mapDispatchToProps = (dispatch) => {
  return bindActionCreators( { fetchUsername }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(Snippet);
