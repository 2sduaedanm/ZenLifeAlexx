import React from "react";
import ReactDOM from "react-dom";
import { Provider } from "react-redux";
import { createStore, applyMiddleware } from 'redux';
import { routerMiddleware } from 'react-router-redux';
import { composeWithDevTools } from 'redux-devtools-extension';

import createHistory from 'history/createBrowserHistory';
import thunk from 'redux-thunk';

import reducer from './ducks';
import Router from './routers'

const history = createHistory();
const router = routerMiddleware(history);
const middlewares = [router, thunk];
const store = createStore(reducer, composeWithDevTools(applyMiddleware(...middlewares)));

ReactDOM.render(
    <Provider store={store}>
        <div>
            <Router/>
        </div>
    </Provider>,
  document.getElementById('content')
);