import HttpClient from './api';

class TokenAPI extends HttpClient {
  getToken(data) {
    return this.doPost(`/api-token-auth/`, data   );
  }

  getProfileData() {
    return this.doGet(`/getUser/`,    );
  }
}

export default TokenAPI;