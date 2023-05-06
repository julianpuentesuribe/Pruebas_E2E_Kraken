class LoginPage {
  constructor(driver) {
    this.driver = driver;
  }

  get usernameInput() {
    return this.driver.$("input[name='identification']");
  }
  get passwordInput() {
    return this.driver.$("input[name='password']");
  }
  get submitButton() {
    return this.driver.$("button[type='submit']");
  }
}

module.exports = LoginPage;