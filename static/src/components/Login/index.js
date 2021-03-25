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

const mapStateToProps = state => ({
  challengeDetails: state.progression.challengeDetails,
});

class Login extends React.Component {

  state = {
    email: '',
    password: '',
    errors: {
      email: false,
      password: false,
    }
  }

  validateFields() {
    const { email, password } = this.state;
    const emailError = email.length === 0;
    const passwordError = password.length === 0;
    this.setState({
      errors: {
        email: emailError,
        password: passwordError
      }
    })
    return !(emailError || passwordError);
  }

  handleSubmit = (event) => {
    const { dispatch, history } = this.props;
    const { email, password } = this.state;

    event.preventDefault();
    const formValid = this.validateFields();
    if (formValid) {
      dispatch(requestLogin(email, password)).then(
        response => {
          if (response !== true) {
            NotificationManager.error(response.non_field_errors[0]);

            if (response.non_field_errors[0] === "Unable to log in with provided credentials.") {
              this.setState({
                errors: {
                  email: true,
                  password: true,
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
    const { errors, email, password } = this.state;

    return (
      <div className="p-3 login-cover">
        <div className="login-image-cover">
          <img src={Logo} alt=""/>
        </div>
        <p className="login-title-text text-center mb-0">Please provide your account data</p>

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
          <button className="mt-4 d-inline-block" type="submit">Login</button>
        </form>
        <p className="mt-4">
          Don't have account yet!
          <Link
            to={`/signup`}>
                Sign Up
          </Link>
        </p>

        <NotificationContainer/>

      </div>
    );
  }

}

export default withRouter(connect(mapStateToProps)(Login));