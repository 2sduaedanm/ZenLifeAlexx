import React from 'react';
import { Link, withRouter } from 'react-router-dom';
import { connect } from 'react-redux';


import {
  requestProgression,
  requestStudentsList,
  requestCurriculum,
  requestChallenge,
} from './../../ducks/progression'

const paramsOrder = ['progression', 'students', 'curriculum', 'challenge'];

const mapStateToProps = state => ({
  progression: state.progression.progression,
  students: state.progression.students,
  curriculum: state.progression.curriculum,
  challenge: state.progression.challenge,
});


class Index extends React.Component {
  fields = ['progression', 'students', 'curriculum', 'challenge'];

  formLink = (pageName) => {
    const { match: { params } } = this.props;
    switch (pageName) {
      case 'progression': {
        return `/progression/${params.progressionId}/students`
      }
      case 'students': {
        return `/progression/${params.progressionId}/students/${params.studentsId}/curriculum`
      }
      case 'curriculum': {
        return `/progression/${params.progressionId}/students/${params.studentsId}/curriculum/${params.curriculumId}/challenge`
      }
      case 'challenge': {
        return `/progression/${params.progressionId}/students/${params.studentsId}/curriculum/${params.curriculumId}/challenge/${params.challengeId}`
      }
      default:
        return ''
    }
  }

  getStringThroughParam = (pageParam) => {
    const pageName = pageParam.replace('Id', '');
    const { match: { params }, dispatch } = this.props;
    switch (pageName) {
      case 'progression': {
        dispatch(requestProgression(params[pageParam]));
        break;
      }
      case 'students': {
        dispatch(requestStudentsList(params.progressionId, false, params[pageParam]));
        break;
      }
      case 'curriculum': {
        dispatch(requestCurriculum(params.progressionId, params.studentsId, params[pageParam]));
        break;
      }
      case 'challenge': {
        dispatch(requestChallenge(params.studentsId,
          params.progressionId,
          params.curriculumId,
          params[pageParam]));
        break;
      }
      default:
        return ''
    }
  }

  componentDidMount() {
    const { match: { params } } = this.props;
    Object.keys(params).forEach(paramItem => this.getStringThroughParam(paramItem))
  }


  render() {
    const { match: { params } } = this.props;
    const filteredParamsOrder = paramsOrder.filter(item => Object.keys(params)
      .indexOf(`${item}Id`) > -1);
      console.log('asdasd');
      console.log(this.props);
      return (
      <ol className="breadcrumb">
        <Link
          to={`/progression`}>
          <li className="active">
              <span>
                Home
                </span>
            <i className="fas fa-arrow-right"></i>
          </li>
        </Link>
        {
          filteredParamsOrder.map((param, index) => (
            <Link key={index}
                  to={this.formLink(param)}>
              <li className="active">
                <span>
                  {this.props[param].toLowerCase()}
                </span>
                  {index < 3 ? <i className="fas fa-arrow-right"></i> : ''}
              </li>
            </Link>
          ))
        }
      </ol>
    );
  };
}


export default withRouter(connect(mapStateToProps)(Index))