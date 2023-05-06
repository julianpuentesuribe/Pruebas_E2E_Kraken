class PageSection {
  constructor(driver) {
    this.driver = driver;
  }

  get newPageButton() {
    return this.driver.$("a[href='#/editor/page/']");
  }

  get editorContainerTitle() {
    return this.driver.$("textarea[placeholder='Page Title']");
  }

  get editorContainerBody() {
    return this.driver.$("div[data-placeholder='Begin writing your page...']");
  }

  get editorPublishDropdown() {
    return this.driver.$("div[role='button'].gh-publishmenu-trigger");
  }

  get editorPublishButton() {
    return this.driver.$("button.gh-publishmenu-button");
  }

  get editorUpdateDropdown() {
    return this.driver.$("div[role='button'].gh-publishmenu-trigger");
  }

  get editorUpdateButton() {
    return this.driver.$("button.gh-publishmenu-button");
  }

  get editorSettingsButton() {
    return this.driver.$("button[title='Settings']");
  }

  get editorDeletePageButton() {
    return cy.get("button").contains("Delete page");
  }

  get modalDeleteButton() {
    return cy.get("button.gh-btn-red").contains("Delete");
  }

  get editorViewPage() {
    return this.driver.$("a.post-view-link");
  }

  get goBackToPagesSection() {
    return this.driver.$("a[href='#/pages/']");
  }

  async pageInList(title) {
    await this.driver.$(".gh-list").waitForExist();

    var pageElements = await this.driver.$$(
      "li.gh-list-row.gh-posts-list-item"
    );
    return await pageElements.find(
      async (element) => element.getText() == title
    );
  }

  notPageInList(title) {
    return cy
      .get("li.gh-list-row.gh-posts-list-item")
      .filter(`:contains("${title}")`)
      .should("not.exist");
  }

  async updatePage() {
    await this.editorUpdateDropdown.click();
    await this.editorUpdateButton.click();
  }

  async publishPage() {
    await this.editorPublishDropdown.click();
    await this.editorPublishButton.click();
  }

  async getPageUrl() {
    await this.editorSettingsButton.click();
    return this.editorViewPage.getAttribute("href");
  }

  async createPage(title, content) {
    await this.newPageButton.click();
    await this.editorContainerTitle.setValue(title);
    await this.editorContainerBody.setValue(content);
  }
}

module.exports = PageSection;
