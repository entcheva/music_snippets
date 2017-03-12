import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { fetchUsername, createSnippet } from './actions';

class Snippet extends Component {

  constructor() {
  	super();
    this.handleSnippet = this.handleSnippet.bind(this);
  }

  componentDidMount() {
    // this.props.fetchUsername()
  }

  handleSnippet() {
    event.preventDefault();
    let name = this.refs.name.value;
    let artist = this.refs.artist.value;
    let notes = this.refs.notes.value;
    let snippet = { name: name, artist: artist, notes: notes, user_id: 999 };
    this.props.createSnippet(snippet);
  }

  render() {
    return (
      <div>
        <h1>Hi from the Snippet component</h1>
        <h3>Welcome</h3>
        <h3>My snippets:</h3>

        <div id="snippetForm">
          <h3>Create A New Snippet:</h3>
          <form onSubmit={ this.handleSnippet }>
            <label>Name: </label>
            <input ref="name" placeholder="Hey Jude" />
            <br/><br/>
            <label>Artist: </label>
            <input ref="artist" placeholder="The Beatles"/>
            <br/><br/>
            <label>Notes: </label>
            <input ref="notes" placeholder="F, C, C6, C7, F, C, F"/>
            <br/><br/>
            <button type="submit">Save Snippet</button>
          </form>

          {this.state}
        </div>





      </div>
    );
  }
}

const mapStateToProps = (state) => {
  return {
    // username: state.user.username,
    snippets: state.snippet,
  }
}

const mapDispatchToProps = (dispatch) => {
  return bindActionCreators( { fetchUsername, createSnippet }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(Snippet);
