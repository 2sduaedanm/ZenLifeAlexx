import React, { Component }  from 'react';
import {
  Redirect,
  Route,
  Switch,
  withRouter,
} from 'react-router-dom';

import Login    from './../../components/Login';
import SignUp   from './../../components/SignUp';


// import '../../layouts/login/style.css';


class Unauthorized extends Component {
  render() {
    return (
      <Switch>

        <Route
          path="/signup"
          exact
          component={SignUp}
        />

        <Route
          path="/login"
          exact
          component={Login}
        />


          <Redirect from="*" to="/login" />
      </Switch>
    );
  }
}

export default withRouter(Unauthorized);