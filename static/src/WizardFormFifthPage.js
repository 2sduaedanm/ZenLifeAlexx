import React, { Component, Fragment } from 'react';
import Breadcrumbs from "./components/BreadCrumbs";
import { NotificationContainer, NotificationManager } from 'react-notifications';
import moment from 'moment';
import { connect } from 'react-redux';
import { withRouter } from 'react-router-dom';
import { Progress } from 'react-sweet-progress';
import Modal from 'react-responsive-modal'

import ProfileMenu from './components/Profile';
import { Collapse, Button, CardBody, Card } from 'reactstrap';
import VideoInput from './_common/videoCapture'
import VideoPlayer from './_common/videoPlayer'

import {
  requestChallengeDetails,
  setSearchContent,
  updateChallengeStatus,
  uploadVideoS3
} from './ducks/progression';

import 'react-notifications/lib/notifications.css';
import './styles/summary.scss'

const mapStateToProps = state => ({
  challengeDetails: state.progression.challengeDetails,
  uploadProgress: state.progression.uploadProgress,
});


class WizardFormFifthPage extends Component {
    constructor(props) {
        super(props);
        this.toggle = this.toggle.bind(this);
        this.state = {
          collapse: false,
          showVideo: false,
          showHint: false,
          currentVideo: '',
          loading: false,
          openModal: false
        };
    }

    toggle() {
        this.setState({ collapse: !this.state.collapse });
    }

  componentDidMount() {
    const { history, dispatch, match: { params: { challengeId, studentsId } } } = this.props;
    if (!(localStorage.getItem('token') || localStorage.getItem('token') && localStorage.getItem(
      'token').length === 0)) {
      history.push('/');
      return;
    }

    dispatch(requestChallengeDetails(studentsId, challengeId))
  }

  componentWillUnmount() {
    const { dispatch } = this.props;

    dispatch(setSearchContent([]))
  }

  handlePass = (event) => {
    const { dispatch, challengeDetails, match: { params } } = this.props;
    const passed = event.target.name==='pass' ? 1 : 0  ;
    const instructed = event.target.name==='instruct' ? 1 : 0;

    dispatch(updateChallengeStatus(params.challengeId, params.studentsId, passed, instructed)).then(response=>{
      if (response=== true){
        this.showNotificationSuccess();
        dispatch(requestChallengeDetails(params.studentsId, params.challengeId))

      }else{
        this.showNotificationError()

      }
    })
  };

  handleUpload = (file) => {
    this.setState({loading: true})
    const { dispatch, match: { params } } = this.props;
    dispatch(uploadVideoS3(0, params.challengeId, params.curriculumId, params.progressionId, params.studentsId, file)).then(response=>{
      if (response=== true){
        this.showNotificationSuccess();
        dispatch(requestChallengeDetails(params.studentsId, params.challengeId))
      }else{
        this.showNotificationError()
      }
      this.setState({loading: false})
    })
  }

  showNotificationSuccess() {
    NotificationManager.success('Challenge data have been updated', '', 1500);

  }

  showNotificationError() {
    NotificationManager.error('Network problem',
      'Please try again latter',1500);

  }

  showVideo = (event, videoLink) => {
    event.preventDefault()
    const endUrl = videoLink.indexOf("?")
    const shortLink = (endUrl > -1) ? videoLink.substring(0, endUrl) : videoLink;
    this.setState({showVideo: true, currentVideo: shortLink, openModal: true, showHint: false})
  }

  showHint = (event) => {
    event.preventDefault()
    this.setState({showVideo: false, showHint: true, openModal: true})
  }

  onCloseModal = () => {
    this.setState({
      showVideo: false,
      currentVideo: '',
      openModal: false,
      showHint: false,
    })
  }
  render() {
    const { challengeDetails, match, uploadProgress } = this.props;
    // console.log(challengeDetails)
    return (
      <div className={'fix_margin'}>
        <div className="suggestions-input-container d-flex">
          <Breadcrumbs/>
          <ProfileMenu/>
        </div>
        <div className="content">
          {
            this.state.loading &&
              <div className="loader">
                <Progress type="circle" percent={uploadProgress} width={'100%'}/>
              </div>
          }
          <h2>{challengeDetails.main && challengeDetails.main.name}</h2>
          <div className="content challenges-content challenges-content-cover">
            {
              challengeDetails.main && !this.state.loading &&
              <Fragment>
                <div className="mt-4">
                  <p>
                    Description: <br/>
                    {challengeDetails.ext.description ? challengeDetails.ext.description : "no data"}
                  </p>
                  <p>Instructor: {challengeDetails.ext.instructor ?
                      <b>{challengeDetails.ext.instructor}</b> : ""}
                  </p>
                  <p>Active: {challengeDetails.main.active ?
                    <b>{challengeDetails.main.active ? "true" : "false"}</b> : "no data"}
                  </p>

                  <p>Instructed: {challengeDetails.ext.instructed === null ? '---'
                     : <b>{challengeDetails.ext.instructed}</b>}
                  </p>
                  <p>Status: {challengeDetails.ext.status === null ? '---'
                      : <b>{challengeDetails.ext.status}</b>}
                  </p>
                  <p>Instructed Date: {challengeDetails.ext.dateinstructed !== null ?
                    <b>{moment(challengeDetails.ext.dateinstructed).format('LLLL')}</b> : "---"}
                  </p>

                  <p>Pass Date: {challengeDetails.ext.datestatus !== null ?
                    <b>{moment(challengeDetails.ext.datestatus).format('LLLL')}</b> : "---"}
                  </p>

                  <p>Hint: {challengeDetails.main.hints !== null ?
                    <a className="watchVideoButton" onClick={(event) => this.showHint(event)} href="#">show hints</a> : "---"}
                  </p>
                  <p>Hint (video): {challengeDetails.main.hints_video !== null ?
                     <a className="watchVideoButton" onClick={(event) => this.showVideo(event, challengeDetails.main.hints_video)} href="#">watch video</a> : "---"}
                  </p>
                  <p>Last try (video): {challengeDetails.ext.hints_video !== null ?
                    <a className="watchVideoButton" onClick={(event) => this.showVideo(event, challengeDetails.ext.hints_video)} href="#">watch video</a> : "---"}
                  </p>

                </div>

                <div className="d-flex justify-content-around">
                  <button
                    onClick={this.handlePass}
                    name={'instruct'}
                  >
                    Instruct
                  </button>
                  <button
                    onClick={this.handlePass}
                    name={'pass'}
                  >
                    Pass challenge
                  </button>
                </div>
                <div>

                </div>
                <VideoInput onUploaded={this.handleUpload}/>
                <div className="d-flex justify-content-around history-block">
                  <button className={challengeDetails.history.length == 0 ? 'action_button_disabled' : ''} disabled={challengeDetails.history.length == 0} onClick={this.toggle} >history</button>
                </div>

                <div className="d-flex justify-content-around history-block">
                  <Collapse isOpen={this.state.collapse}>
                    {
                    challengeDetails.history.length > 0 &&
                    challengeDetails.history.map((challengeDetailsItem, index) =>
                    (
                    <Card key={index}>
                      <CardBody>
                        <p>
                          <b>{challengeDetailsItem.status_flag}</b>
                        </p>
                        <p>
                          Date:
                          <b>
                          {challengeDetailsItem.status_flag && challengeDetailsItem.status_flag.toLocaleLowerCase() == 'passed' ?
                              moment(challengeDetailsItem.datestatus).format('LLLL') :
                              moment(challengeDetailsItem.dateinstructed).format('LLLL')}
                          </b>
                        </p>
                        {challengeDetailsItem.hints_video &&
                          <p>
                            <a className="watchVideoButton" onClick={(event) => this.showVideo(event, challengeDetailsItem.hints_video)} href="#">watch video</a>
                          </p>
                        }
                        <p>
                          Instructor: <b>{challengeDetailsItem.instructor}</b>
                        </p>
                      </CardBody>
                    </Card>
                    )
                    )
                    }
                  <button className="close-button" onClick={this.toggle} >close</button>
                  </Collapse>
                </div>
              </Fragment>
            }
          </div>
        </div>
        <NotificationContainer/>
        <Modal
          open={this.state.openModal}
          onClose={this.onCloseModal} center
          classNames={{
            modal: 'customModal',
          }}>
          {this.state.showVideo && <VideoPlayer url={this.state.currentVideo} />}
          {this.state.showHint && <p>{challengeDetails.main.hints}</p>}
        </Modal>
      </div>
    );
  }
}


export default withRouter(connect(mapStateToProps)(WizardFormFifthPage));
