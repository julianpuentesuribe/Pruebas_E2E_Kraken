class DesignSection {
  constructor(driver) {
    this.driver = driver;
  }

  get saveButton() {
    return this.driver.$("button.gh-btn-blue");
  }

  get goViewSite() {
    return this.driver.$("a[href='#/site/']");
  }

  get navigationLabels() {
    return this.driver.$$("#settings-navigation input[placeholder='Label']");
  }

  async createNav(label, url) {
    const labelInput = await this.driver.$(
      "form#settings-navigation > :nth-child(2) input[placeholder='Label']"
    );
    const urlInput = await this.driver.$(
      "form#settings-navigation > :nth-child(2) input:not([placeholder])"
    );
    await labelInput.setValue(label);
    await urlInput.setValue(url);
  }

  async saveDesign() {
    await this.saveButton.click();
  }
}

module.exports = DesignSection;
