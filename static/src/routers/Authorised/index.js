import React, { Component } from 'react';
import {
  Redirect,
  Route,
  Switch,
  withRouter,
} from 'react-router-dom';

import WizardForm from './../../WizardForm'
import WizardFormFifthPage from './../../WizardFormFifthPage'

// {/*<AppLayout>*/}


class Authorised extends Component {
  render() {
    return (
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
          path="/progression"
          component={WizardForm}
        />


        {/*<RouterWithPermission*/}
        {/*permission={session.termsAccepted}*/}
        {/*path="/"*/}
        {/*component={Protected}*/}
        {/*redirectUrl="/terms"*/}
        {/*/>*/}



        <Redirect from="*" to="/progression"/>
      </Switch>
    );
  }
}

export default withRouter(Authorised);