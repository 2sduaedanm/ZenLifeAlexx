import React, { Component, Fragment } from 'react';
import PropTypes from 'prop-types';

const initialState = {
  again: false,
  uploaded: false,
  selectedFile: null,
  timer: null,
  alertText: ''
}

class VideoCapture extends Component {

  state = initialState

  startCapture = (event) => {
    event.preventDefault()
    const newTimer = setTimeout( ()  =>{
      this.handleToBigUpload()
    }, 5 * 60 * 1000 )
    this.setState({
      timer: newTimer,
      again :false,
    })
    this.inputElement.click()
  }

  handleToBigUpload = () => {
    clearInterval(this.state.timer)
    this.setState({
      alertText: 'Uploaded video too long!',
      again: true,
    })
  }

  handleInput = (event) => {
    clearInterval(this.state.timer)
    this.setState({
      selectedFile: event.target.files[0],
      uploaded: true,
    })
  }

  uploadFile = () => {
    this.props.onUploaded(this.state.selectedFile)
    this.setState({...initialState})
    this.inputElement.value = null
  }

  switchToAgain = () => {
    this.setState({
      ...this.state,
      again: true,
      alertText: '',
    })
    this.inputElement.value = null
  }

  cancelUpload = () => {
    this.setState({...initialState})
    this.inputElement.value = null
  }

  render() {

    const alertElement = this.state.alertText.length > 0 ? (<h2>{this.state.alertText}</h2>): ''

    const recordAgainElement = (
      <Fragment>
        <div>
          <button onClick={this.cancelUpload}>NO</button>
        </div>
        <div>
          {alertElement}
          <h2>Record again?</h2>
        </div>
        <div>
          <button onClick={this.startCapture}>YES</button>
        </div>
      </Fragment>
    )

    const submitUploadElement = (
      <Fragment>
        <div>
          <button onClick={this.switchToAgain}>NO</button>
        </div>
        <div>
          <h2>Submit video to student profile?</h2>
        </div>
        <div>
          <button onClick={this.uploadFile}>YES</button>
        </div>
      </Fragment>
    )

    const captureButton = (
      <div>
        <button onClick={this.startCapture}>Record video</button>
      </div>
    )

    const uiElements = this.state.uploaded ?
      (this.state.again ? recordAgainElement : submitUploadElement)
      : captureButton

    return (
      <div className="videoCapture">
        {uiElements}
        <input
          ref={input => this.inputElement = input}
          onChange={this.handleInput}
          type="file"
          accept="video/*;capture=camcorder"
        />

      </div>
    )
  }
}

VideoCapture.propTypes = {
  onUploaded: PropTypes.func.isRequired,
};

export default VideoCapture