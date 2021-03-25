import React from 'react'

import './../../styles/summary.scss'
import { connect } from 'react-redux';
import { Link, withRouter } from 'react-router-dom';

import {
  requestLogin,
} from './../../ducks/login';
import { NotificationContainer, NotificationManager } from 'react-notifications';
import Logo from '../../resources/images/react.png'
import { push } from 'react-router-redux';
import DatePicker from 'react-mobile-datepicker';

const mapStateToProps = state => ({
  challengeDetails: state.progression.challengeDetails,
});

class SignUp extends React.Component {

  state = {
    email: '',
    password: '',
    fullname: '',
    errors: {
      email: false,
      password: false,
      fullname: false,
    },
      time: new Date(),
      isOpen: false,
      theme: 'ios',
      confirmText: 'Ok',
      cancelText: 'Cancel',
      headerFormat: 'D-MMM-YYYY'
  }

  convertDate = (date, formate) => {
    const year = date.getFullYear();
    const month = date.getMonth() + 1;
    const day = date.getDate();
    const hour = date.getHours();
    const minute = date.getMinutes();
    const second = date.getSeconds();

    return formate
         .replace(/Y+/, year)
         .replace(/M+/, month)
         .replace(/D+/, day)
         .replace(/h+/, hour)
         .replace(/m+/, minute)
         .replace(/s+/, second);
  }

  handleClick = () => {
		this.setState({ isOpen: true });
  }

  handleCancel = () => {
      this.setState({ isOpen: false });
  }

  handleSelect = (time) => {
      this.setState({ time, isOpen: false });
  }

  handleToggle = (isOpen) => () => {
      this.setState({ isOpen });
  };

  validateFields() {
    const { email, password, fullname } = this.state;
    const emailError = email.length === 0;
    const passwordError = password.length === 0;
    const fullnameError = fullname.length === 0;
    this.setState({
      errors: {
        email: emailError,
        password: passwordError,
        fullname: fullnameError,
      }
    })
    return !(emailError || passwordError);
  }

  handleSubmit = (event) => {
    const { dispatch, history } = this.props;
    const { email, password, fullname } = this.state;

    event.preventDefault();
    const formValid = this.validateFields();
    if (formValid) {
      dispatch(requestLogin(email, password, fullname)).then(
        response => {
          if (response !== true) {
            NotificationManager.error(response.non_field_errors[0]);

            if (response.non_field_errors[0] === "Unable to log in with provided credentials.") {
              this.setState({
                errors: {
                  email: true,
                  password: true,
                  fullname: true
                }
              })
            }
          } else {
            history.push('/progression');

            NotificationManager.info('You have successfully  logged-In');
          }
        }
      )
    }
  }

  handleChange = (event) => {
    const fieldName = event.target.name;
    const fieldValue = event.target.value;
    this.setState({
      [fieldName]: fieldValue,
      errors: {
        ...this.state.errors,
        [fieldName]: false
      }
    })
  }

  render() {
    const { errors, email, password, fullname } = this.state;

    const monthMap = {
        '1': 'Jan',
        '2': 'Feb',
        '3': 'Mar',
        '4': 'Apr',
        '5': 'May',
        '6': 'Jun',
        '7': 'Jul',
        '8': 'Aug',
        '9': 'Sep',
        '10': 'Oct',
        '11': 'Nov',
        '12': 'Dec',
    };

    const dateConfig = {
        'year': {
            format: 'YYYY',
            caption: 'Year',
            step: 1,
        },
        'month': {
            format: value => monthMap[value.getMonth() + 1],
            caption: 'Mon',
            step: 1,
        },
        'date': {
            format: 'DD',
            caption: 'Day',
            step: 1,
        },
    };

    return (
      <div className="p-3 signup-cover">
        <div className="login-image-cover">
          <img src={Logo} alt=""/>
        </div>
        <p className="login-title-text text-center mb-0">Please fill your account data</p>

        <form onSubmit={this.handleSubmit}>
          <div className="position-relative mt-4">
            <input
              name={'email'}
              placeholder="Email"
              type="text"
              onChange={this.handleChange}
              value={email}
            />
            <p className="form-error-message">
              {errors.email && 'Required field'}
            </p>
          </div>
          <div className="position-relative mt-4">
            <input
              name={'password'}
              placeholder="Password"
              type="password"
              onChange={this.handleChange}
              value={password}

            />
            <p className="form-error-message">
              {errors.password && 'Required field'}
            </p>
          </div>
          <div className="position-relative mt-4">
            <input
              name={'password'}
              placeholder="Repeat Password"
              type="password"
              onChange={this.handleChange}
              value={password}

            />
            <p className="form-error-message">
              {errors.password && 'Required field'}
            </p>
          </div>
          <div className="position-relative mt-4">
            <input
              name={'fullname'}
              placeholder="Full Name"
              type="text"
              onChange={this.handleChange}
              value={fullname}
            />
            <p className="form-error-message">
              {errors.fullname && 'Required field'}
            </p>
          </div>
          <div className="position-relative mt-4">
            <a
                className="btn btn-primary btn-dob btn-block"
                onClick={this.handleClick}>
                Date of Birth (P569): &nbsp; {this.convertDate(this.state.time, 'YYYY-MM-DD')}
            </a>
            <DatePicker
                dateConfig={dateConfig}
                showCaption
                showHeader
                headerFormat={this.state.headerFormat}
                confirmText={this.state.confirmText}
                cancelText={this.state.cancelText}
                value={this.state.time}
                theme={this.state.theme}
                // isPopup={this.state.isOpen}
                isOpen={this.state.isOpen}
                onSelect={this.handleSelect}
                onCancel={this.handleToggle(false)} />
          </div>
          <div className="position-relative mt-4">
            <label className="">
              <input type="checkbox"
                checked={this.state.isChecked}
                onChange={this.toggleChange}
              />
              I accept the ToS
            </label>
          </div>
          <button className="mt-4 d-inline-block" type="submit">SignUp</button>
        </form>
        <p className="mt-4">
          Already have an account!
          <Link
            to={`/`}>
                Login
          </Link>
        </p>

        <NotificationContainer/>

      </div>
    );
  }

}

export default withRouter(connect(mapStateToProps)(SignUp));