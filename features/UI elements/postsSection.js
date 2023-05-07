class PostSection {
  constructor(driver) {
    this.driver = driver;
  }

  get newPostButton() {
    return this.driver.$("a[href='#/editor/post/']");
  }

  get editorContainerTitle() {
    return this.driver.$("textarea[placeholder='Post Title']");
  }

  get editorContainerBody() {
    return this.driver.$("div[data-placeholder='Begin writing your post...']");
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

  get editorDeletePostButton() {
    return this.driver.$("button.settings-menu-delete-button");
  }

  get modalDeleteButton() {
    return this.driver.$("button.gh-btn-red");
  }

  get editorViewPost() {
    return this.driver.$("a.post-view-link");
  }

  get goBackToPostsSection() {
    return this.driver.$("a[href='#/posts/']");
  }

  async postInList(title) {
    await this.driver.$(".gh-list").waitForExist();

    var postElements = await this.driver.$$(
      "li.gh-list-row.gh-posts-list-item"
    );
    return await postElements.find(
      async (element) => element.getText() == title
    );
  }

  async updatePost() {
    await this.editorUpdateDropdown.click();
    await this.editorUpdateButton.click();
  }

  async publishPost() {
    await this.editorPublishDropdown.click();
    await this.editorPublishButton.click();
  }

  async getPostUrl() {
    await this.editorSettingsButton.click();
    return this.editorViewPost.getAttribute("href");
  }

  async createPost(title, content) {
    await this.newPostButton.click();
    await this.editorContainerTitle.setValue(title);
    await this.editorContainerBody.setValue(content);
  }

  async deletePost() {
    await this.editorSettingsButton.click();
    await this.editorDeletePostButton.click();
    await this.driver.$(".modal-content").waitForExist();
    const deleteButton = await this.modalDeleteButton;
    await this.driver.execute((el) => el.click(), deleteButton);
    await deleteButton.click();
    await this.driver.$(".gh-canvas").waitForExist();
  }
}

module.exports = PostSection;
