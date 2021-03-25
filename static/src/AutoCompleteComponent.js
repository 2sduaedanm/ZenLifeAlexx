import React, { Component, Fragment } from 'react';
import { connect } from 'react-redux';
import { Link, withRouter } from 'react-router-dom'
// import ImageUploader from 'react-images-upload';
import 'bootstrap/dist/css/bootstrap.min.css';
import './styles/autocomplete.css'
import './styles/style.css'

import './styles/summary.scss'
import Breadcrumbs from './components/BreadCrumbs/index'
import ProfileMenu from './components/Profile'
import ImageUploader from "./components/ImageUploader";
import {requestStudentsList, updateStudentPhoto} from "./ducks/progression";

const lettersArray = ("abcdefghijklmnopqrstuvwxyz").toUpperCase().split("");

const searchKeys = ['short', 'full_name'];


const mapStateToProps = state => ({
  searchContent: state.progression.searchContent,
  pageKey: state.progression.pageKey,
});

const mapDispatchToProps = dispatch => ({
  updateStudentPhoto: (studentId, file) => dispatch(updateStudentPhoto(studentId, file)),
  requestStudentsList: (progressionId, doNotUpdateProgression) => dispatch(requestStudentsList(progressionId, doNotUpdateProgression)),
});
class AutoCompleteComponent extends Component {
  constructor(props) {
    super(props);

    this.state = {
      suggestions: [],
      search: '',
      select: '',
      pictures: []
    };
  }


  handleLinkClick = (e) => {
    if(e.target.nodeName === "LABEL") {
      e.preventDefault();
    }
  };

  onDrop = (e, studentId) => {
    const {files} = e.target;
    this.props.updateStudentPhoto(files[0], studentId)
        .then((res) => {
          this.props.requestStudentsList(this.props.match.params.progressionId, true)
        })
  };

  filterSearchContent(inputValue, name) {
    const { searchContent, pageKey, } = this.props;
    let suggestions = [];
    if (pageKey === "challenge" && name === 'select') {
      const incomArray = searchContent.map(item => {
          const challenges = [...item.challenges];
          return { ...item, challenges }
        }
      );
      switch (inputValue) {
        case "default": {
          suggestions = incomArray.map(chalangeCategory => {
            chalangeCategory.challenges = chalangeCategory.challenges.filter(item => {
              return item.passed === null || item.passed === false
            });
            return chalangeCategory
          });
          break;
        }
        case 'passed': {
          suggestions = incomArray.map(chalangeCategory => {
            chalangeCategory.challenges = chalangeCategory.challenges.filter(item => {
              return item.passed === true

            });
            return chalangeCategory
          });
          break;
        }
        case 'all': {
          suggestions = incomArray;
          break;
        }

      }
      this.setState({
        select: inputValue,
        suggestions
      });
      return
    } else if (pageKey === "challenge" && name !== 'select') {
      const incomArray = searchContent.map(item => {
          const challenges = [...item.challenges];
          return { ...item, challenges }
        }
      );

      suggestions = incomArray.map(chalangeCategory => {
        chalangeCategory.challenges = chalangeCategory.challenges.filter(item => {
          return item.name.toLowerCase().indexOf(inputValue.toLowerCase()) > -1
        });
        return chalangeCategory
      });

      this.setState({
        search: inputValue,
        suggestions
      });
      return

    }

    suggestions = searchContent.filter(progressItem => (
      //todo:  add more filtering fields
      searchKeys.some(key => (
        progressItem[key] && progressItem[key].toLowerCase().indexOf(inputValue.toLowerCase()) > -1
      ))
    ));

    this.setState({
      search: inputValue,
      suggestions
    })
  }

  onChange = (event) => {
    const inputValue = event.target.value;
    const name = event.target.name;
    this.filterSearchContent(inputValue, name);
  };


  componentDidUpdate(prevProps) {
    const { pageKey, match, searchContent: nextContent, } = this.props;
    const { searchContent: prevContent } = prevProps; // prev

    if (prevProps.match.path !== match.path) {
      this.setState({
        suggestions: [],
        search: '',

      })
    } else if (nextContent.length > 0 &&
      this.state.suggestions.length === 0 &&
      this.state.search === '' ||
      nextContent !== prevContent
    ) {
      if (pageKey === 'challenge' && nextContent[0] && nextContent[0].challengetype) {
        this.filterSearchContent("default", "select");
        return;
      }
      this.setState({
        suggestions: nextContent,
      })
    }
  }

  filledLettersArray() {
    const { suggestions } = this.state;
    let filledObject = {};
    const newArray = lettersArray.filter(letter => {
      return suggestions.some(user => {
        return user.first_name[0] === letter
      })
    });

    newArray.forEach(letter => {
      filledObject[letter] = suggestions.filter(user =>
        user.first_name[0] === letter
      )
    });
    return filledObject
  }

  filledCategoryChalanges() {

    const { suggestions } = this.state;
    let categoryList = [];
    let filledObject = {};

    suggestions.forEach(challengeItem => {
      filledObject[challengeItem.challengetype.name] = challengeItem.challenges
    });
    return filledObject
  }

  formLink = (id) => {
    const { pageKey, match } = this.props;
    switch (pageKey) {
      case "progression":
        return `/progression/${id}/students`;
      case "students":
        return `/progression/${match.params.progressionId}/students/${id}/curriculum/`;
      case "curriculum":
        return `/progression/${match.params.progressionId}/students/${match.params.studentsId}/curriculum/${id}/challenge/`;
      case "challenge":
        return `/progression/${match.params.progressionId}/students/${match.params.studentsId}/curriculum/${match.params.curriculumId}/challenge/${id}`;
      default :
        return '/progression';
    }
  };

  handleLetterPick = (event) => {
    const inputValue = event.target.innerHTML;
    const { searchContent, } = this.props;

    const suggestions = searchContent.filter(progressItem => (
      searchKeys.some(key => (
        progressItem[key] && progressItem[key].toLowerCase()[0] === inputValue.toLowerCase()
      ))
    ));
    this.setState({
      search: inputValue,
      suggestions
    })
  };

  render() {
    const { pageKey, match, searchContent } = this.props;
    const { suggestions } = this.state;
    let filledAlphabateArray = {};
    if (pageKey === 'students' && suggestions.length !== 0 && suggestions[0].first_name) {
      filledAlphabateArray = this.filledLettersArray()
    }
    if (pageKey === 'challenge' && suggestions.length !== 0 &&  suggestions[0].challengetype) {
      filledAlphabateArray = this.filledCategoryChalanges()

      Object.keys(filledAlphabateArray).forEach(item => {
        if (filledAlphabateArray[item].length === 0) {
          delete filledAlphabateArray[item]
        }
      })
    }

      console.log(suggestions);
      console.log(searchContent);
      console.log(filledAlphabateArray);
      console.log(pageKey);
      return (
      <React.Fragment>
        <div className="suggestions-input-container align-items-start">
          <div className="d-flex ">
            <Breadcrumbs/>
            <ProfileMenu/>
          </div>
          {
            pageKey === 'students' &&
            <div className="letter-picker">
              {
                lettersArray.map(letter => (
                  <button key={letter} onClick={this.handleLetterPick}>
                    {letter}
                  </button>
                ))
              }
            </div>
          }
          <div className="suggestions-input-cover">
            {
              pageKey !== "challenge" &&
              <Fragment>
                <button className="search-btn">
                  <i className="fas fa-search"></i>
                </button>
                <input
                  className="suggestions-input"
                  placeholder="Search"
                  type="text"
                  value={this.state.search}
                  onChange={this.onChange}/>
                <button className="voice-btn">
                  <i className="fas fa-microphone"></i>
                </button>
              </Fragment>
            }

            {
              pageKey === "challenge" &&
              < div className="challenges-selects-cover mt-2">
                <div className="position-relative">
                  <button className="search-btn">
                    <i className="fas fa-search"></i>
                  </button>
                  <input
                    className="suggestions-input"
                    placeholder="Search:"
                    type="text"
                    value={this.state.search}
                    onChange={this.onChange}/>
                  <button className="voice-btn">
                    <i className="fas fa-microphone"></i>
                  </button>
                </div>
                <select
                  className="suggestions-input pl-3"
                  onChange={this.onChange}
                  name="select"
                  defaultValue={""}
                >
                  <option value={""} disabled>Pick Filter</option>
                  <option value="all">Show All</option>
                  <option value={'passed'}>Show Passed</option>
                  <option value={"default"}>Show Not passed</option>
                </select>
              </div>
            }
          </div>
        </div>
        <div className="content">
          <h2>Select {pageKey}</h2>
          <div className="panel-list">
            {
              suggestions.length > 0 &&
              pageKey === "progression" &&
              suggestions.map((suggestionItem, index) =>
                (
                  <Link
                    key={index}
                    to={this.formLink(suggestionItem.id)}
                  >
                    <div
                      className="panel d-flex align-content-center justify-content-between"
                    >
                      <div className={pageKey === "challenge" ? 'challenges-text-cover' : ''}>
                        <h3>
                          {suggestionItem.short} ({suggestionItem.students_amount} students)
                        </h3>
                      </div>
                      <div className="d-flex justify-content-between align-items-center">
                        {
                          pageKey === "challenge" &&
                          <div className={`status-label ${suggestionItem.passed === true ? 'status-label__passed' : 'status-label__failed' } `}>
                            <p className="mb-0 ">
                              {suggestionItem.passed === true && "Passed"}
                              {suggestionItem.passed === false && "Failed"}
                              {suggestionItem.passed === null && "Not passed"}
                            </p>
                          </div>
                        }

                        <button className="slide-toggle" type="button">
                          <i className="fas fa-angle-right"></i>
                        </button>
                      </div>

                    </div>
                  </Link>
                ))
            }

            {
              suggestions.length > 0 &&
              pageKey === "curriculum" &&
              suggestions.map((suggestionItem, index) =>
                (
                  <Link
                    key={index}
                    to={this.formLink(suggestionItem.id)}
                  >
                    <div
                      className="panel d-flex align-content-center justify-content-between"
                    >
                      <div className={pageKey === "challenge" ? 'challenges-text-cover' : ''}>
                        <h3>
                          {suggestionItem.short}
                        </h3>
                        {suggestionItem.challenges_total &&
                        suggestionItem.challenges_total !== suggestionItem.challenges_passed &&
                        (
                          <div className="student-details">
                            <span>Progress:</span><span> {suggestionItem.challenges_passed}/{suggestionItem.challenges_total}</span>;
                          </div>
                        )
                        }

                        {suggestionItem.challenges_total &&
                        suggestionItem.challenges_total === suggestionItem.challenges_passed &&
                        (
                            <div className="student-details">
                              <span>Progress:</span> <span className="ready-for-testing">Ready for testing</span>;
                            </div>
                          )
                        }
                      </div>
                      <div className="d-flex justify-content-between align-items-center">

                        <button className="slide-toggle" type="button">
                          <i className="fas fa-angle-right"></i>
                        </button>
                      </div>

                    </div>
                  </Link>
                ))
            }
            {
              suggestions.length > 0 &&
              (pageKey === "students" || pageKey === "challenge") &&
              Object.keys(filledAlphabateArray).length > 0 &&
              Object.keys(filledAlphabateArray).map((letter, index) => (
                <Fragment key={index}>
                  <div
                    className="panel bg-white d-flex align-content-center justify-content-between"
                  >
                    <div>
                      <h3>
                        <strong>{letter}</strong>
                      </h3>
                    </div>
                  </div>
                  {
                    filledAlphabateArray[letter].map(user => (
                      <Link
                        onClick={this.handleLinkClick}
                        key={user.id}
                        to={this.formLink(user.id)}
                      >
                        <div
                          className="panel d-flex flex-row align-content-center justify-content-between"
                        >
                          <div className={pageKey === "challenge" ? 'challenges-text-cover' : ''}>
                            {pageKey === "challenge" && (
                            <h3>
                                {user.full_name}
                                {user.short}
                            </h3>
                            )}
                            {user.curriculum && (
                              <div className="student-details">
                                <div className="row">
                                  <div className="pt-0 pb-0 pl-3 pr-1">
                                      <img src={process.env.REACT_APP_MEDIA_SERVER + user.img} alt=""/>
                                  </div>
                                  <div className="pt-0 pb-0 pl-1 pr-1">
                                      <h3 className="student">
                                          {user.full_name}
                                          {user.short}
                                      </h3>
                                      <br/>
                                      <span>Belt:</span><span> {user.curriculum_short.toLowerCase()}</span>
                                      <br/>
                                      <span>Age:</span><span> {user.age.y} years, {user.age.m} months</span>
                                      <br/>
                                      <ImageUploader  onChange={(e) => this.onDrop(e, user.id)} />
                                  </div>
                                </div>
                                <div className="row">
                                  <div className="pt-0 pb-0 pl-3 pr-7">
                                    <img src={process.env.REACT_APP_MEDIA_SERVER + user.curriculum.img} alt=""/>
                                  </div>
                                </div>
                              </div>
                            )}
                          </div>
                          <div className="d-flex justify-content-between align-items-center">
                            {
                              pageKey === "challenge" &&
                              <div className={`status-label ${(user.instructed === true &&  user.passed === null) ? 'status-label__instructed' : user.passed === true ? 'status-label__passed' : 'status-label__failed' } `}>
                                <p className="mb-0 ">
                                  {user.instructed === true && user.passed === true && "Passed"}
                                  {user.instructed === true && user.passed === false && "Failed"}
                                  {(user.instructed === null || user.instructed === false) && user.passed === null && "Not passed"}
                                  {user.instructed === true && user.passed === null && "Instructed"}
                                </p>
                              </div>
                            }

                            <button className="slide-toggle" type="button">
                              <i className="fas fa-angle-right"></i>
                            </button>
                          </div>
                        </div>
                      </Link>
                    ))
                  }
                </Fragment>
              ))
            }
          </div>
        </div>
      </React.Fragment>
    );
  }
}

AutoCompleteComponent.defaultProps = {
  choices: [],
  placeholder: "",
  addFilter: false,
};

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(AutoCompleteComponent))
