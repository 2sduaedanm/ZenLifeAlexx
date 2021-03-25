import React, { Component } from 'react'
import { connect } from 'react-redux';

import AutoCompleteComponent from './AutoCompleteComponent'
import {NotificationContainer, NotificationManager} from 'react-notifications';

import {
  requestProgression,
  setPageKey,
  requestStudentsList,
  requestCurriculum,
  requestChallenge,
  setSearchContent
} from './ducks/progression'

const mapStateToProps = state => ({
  token: state.login.token,
});

class WizardForm extends Component {
  constructor(props) {
    super(props);
    this.nextPage = this.nextPage.bind(this);
    this.previousPage = this.previousPage.bind(this);
    this.state = {
      page: 1
    }
  }

  componentDidMount() {
    const { dispatch, history } = this.props;
    if (!(localStorage.getItem('token') || localStorage.getItem('token') && localStorage.getItem('token').length === 0)) {
      history.push('/');
      return;
    }
    this.handleCurrentPage()
  }

  handleCurrentPage() {
    const { dispatch, match } = this.props;
    if (match.path === '/progression') {
      dispatch(requestProgression())
      dispatch(setPageKey('progression'))
    } else if (match.path === '/progression/:progressionId/students') {
      dispatch(requestStudentsList(match.params.progressionId));
      dispatch(setPageKey('students'))
    } else if (match.path === '/progression/:progressionId/students/:studentsId/curriculum') {
      dispatch(requestCurriculum(match.params.progressionId, match.params.studentsId));
      dispatch(setPageKey('curriculum'))
    } else if (match.path === '/progression/:progressionId/students/:studentsId/curriculum/:curriculumId/challenge') {
      dispatch(requestChallenge(match.params.studentsId,
        match.params.progressionId,
        match.params.curriculumId));
      dispatch(setPageKey('challenge'))
    }

  }

  componentDidUpdate(prevProps) {
    const { dispatch, match } = this.props;
    if (this.props.match.path.length > prevProps.match.path) {
      dispatch(setSearchContent([]))
    }
    if (match.path !== prevProps.match.path) {
      this.handleCurrentPage(prevProps)
    }
  }


  nextPage() {
    this.setState({ page: this.state.page + 1 })
  }

  previousPage() {
    this.setState({ page: this.state.page - 1 })
  }

  setPage = (page) => {
    this.setState({ page });
  }

  render() {

    return (
      <div>
        <AutoCompleteComponent/>
        <NotificationContainer/>

      </div>
    )
  }
}

export default connect(mapStateToProps)(WizardForm)