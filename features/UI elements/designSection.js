class DesignSection {
  constructor(driver) {
    this.driver = driver;
  }

  get labelInput() {
    return this.driver.$('input[placeholder="Label"]').eq(-2);
  }

  get addButton() {
    return this.driver.$("button.gh-blognav-add");
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

  get navigationLinks() {
    return this.driver.$$("#settings-navigation span.gh-blognav-url input");
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

  async createLink(label, link) {
    const labels = await this.navigationLabels;
    const links = await this.navigationLinks;
    await labels[labels.length - 1].setValue(label);
    await links[links.length - 1].setValue(link);
    await this.addButton.click({ force: true });
  }
}

module.exports = DesignSection;
