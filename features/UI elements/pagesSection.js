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
    return this.driver.$("button.settings-menu-delete-button");
  }

  get modalDeleteButton() {
    return this.driver.$("button.gh-btn-red");
  }

  get editorViewPage() {
    return this.driver.$("a.post-view-link");
  }

  get goBackToPagesSection() {
    return this.driver.$("a[href='#/pages/']");
  }

  async pageInList(title) {
    await this.driver.$(".gh-list").waitForExist();

    let pageElements = await this.driver.$$(
      "li.gh-list-row.gh-posts-list-item"
    );

    let pageFinded;

    for (let i = 0; i < pageElements.length; i++) {
      let pageText = await pageElements[i].getText();
      if (pageText.includes(title)) {
        console.log("--------FINDED TITLE--------", pageText, title);
        pageFinded = pageElements[i];
        break;
      }
    }

    return pageFinded;
  }

  async deletePage() {
    await this.editorSettingsButton.click();
    await this.editorDeletePageButton.click();
    await this.driver.$(".modal-content").waitForExist();
    const deleteButton = await this.modalDeleteButton;
    await this.driver.execute((el) => el.click(), deleteButton);
    await deleteButton.click();
    await this.driver.$(".gh-canvas").waitForExist();
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
