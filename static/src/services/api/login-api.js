import HttpClient from './api';

const getLanguage = () => localStorage.getItem('language');

class LoginAPI extends HttpClient {
  loginWithPassword(email, password) {
    return this.doPost(`users/authorized?locale=${getLanguage()}`, {
      username: email,
      password,
    });
  }

  logOut() {
    return this.doPost(`users/non-authorized?locale=${getLanguage()}`, {});
  }

  signUp(Login, Password, PasswordRepeated, FullName, IsAgreementConfirmed, dateOfBirth) {
    return this.doPost(`users?locale=${getLanguage()}`, {
      Login,
      Password,
      PasswordRepeated,
      FullName,
      IsAgreementConfirmed,
      Birthday: dateOfBirth,
    });
  }

  resetPass(ResetCode, Password, PasswordRepeated) {
    return this.doPost(`users/restored?locale=${getLanguage()}`, {
      ResetCode,
      Password,
      PasswordRepeated,
    });
  }

  forgotPassword(Login) {
    return this.doPost(`users/forgotten?locale=${getLanguage()}`, {
      Login,
    });
  }

  confirmEmail(data) {
    return this.doPost(`/users/confirmed?locale=${getLanguage()}`, data);
  }
}

export default LoginAPI;