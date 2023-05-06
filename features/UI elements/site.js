class Site {
  constructor(driver) {
    this.driver = driver;
  }

  get pageTitle() {
    return this.driver.$("h1.post-full-title");
  }

  get pageContent() {
    return this.driver.$("section.post-full-content");
  }

  get page404() {
    return this.driver.$("h1.error-code");
  }
}

module.exports = Site;
