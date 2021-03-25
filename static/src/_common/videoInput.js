import React, { Component } from 'react';
import PropTypes from 'prop-types';

class videoInput extends Component {

  startCapture = (event) => {
    event.preventDefault()
    this.inputElement.click()
  }

  handleInput = (event) => {
    this.props.onUploaded(event.target.files[0])
    this.inputElement.value = null
  }

  render() {

    return (
      <div className="videoCapture">
        <div>
          <button onClick={this.startCapture}>Capture</button>
        </div>
        <input
          ref={input => this.inputElement = input}
          onChange={this.handleInput}
          type="file" accept="video/*" capture
        />

      </div>
    )
  }
}

videoInput.propTypes = {
  onUploaded: PropTypes.func.isRequired,
};

export default videoInput