import React, { Component } from 'react';
import {
  Redirect,
  Route,
  Switch,
  withRouter,
  BrowserRouter
} from 'react-router-dom';


// import Authorized from './Authorised';

// import Unauthorized from './Unauthorised';
import WizardFormFifthPage from '../WizardFormFifthPage';
import WizardForm from '../WizardForm';
import Login from '../components/Login';
import SignUp from '../components/SignUp';

class Router extends Component {
  render() {
    // const token = localStorage.getItem('token');

    return (
      <BrowserRouter>
        <Switch>

        <Route
          exact
          path="/progression/:progressionId/students"
          component={WizardForm}
        />

        <Route
          // exact
          path="/progression/:progressionId/students/:studentsId/curriculum/:curriculumId/challenge/:challengeId"
          component={WizardFormFifthPage}
        />

        <Route
          // exact
          path="/progression/:progressionId/students/:studentsId/curriculum/:curriculumId/challenge"
          component={WizardForm}
        />

        <Route
          // exact
          path="/progression/:progressionId/students/:studentsId/curriculum"
          component={WizardForm}
        />
        {/*chalanges*/}


        <Route
            path="/signup"
            component={SignUp}
        />

        <Route
          path="/progression"
          component={WizardForm}
        />

        <Route
            exact
            path="/"
            component={Login}
        />


        <Redirect from="*" to="/"/>
        </Switch>
      </BrowserRouter>
    );
  }
}

export default Router;