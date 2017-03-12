import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { fetchUsername } from './actions';

class Snippet extends Component {

  constructor() {
  	super();

    this.saveSnippet = this.saveSnippet.bind(this);
  }

  componentDidMount() {
    // this.props.fetchUsername()
  }

  saveSnippet() {

  }



  render() {
    return (
      <div>
        <h1>Hi from the Snippet component</h1>
        <h3>Welcome</h3>
        <h3>My snippets:</h3>

        <div id="snippetForm">
          <h3>Create A New Snippet:</h3>
          <form onSubmit={ this.saveSnippet }>
            <label>Name: </label>
            <input ref="snippetName" placeholder="Hey Jude" />
            <br/><br/>
            <label>Artist: </label>
            <input ref="snippetArtist" placeholder="The Beatles"/>
            <br/><br/>
            <label>Notes: </label>
            <input ref="snippetNotes" placeholder="F, C, C6, C7, F, C, F"/>
            <br/><br/>
            <button type="submit">Save Snippet</button>
          </form>
        </div>





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
