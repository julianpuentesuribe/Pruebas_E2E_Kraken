class TagSection {
  constructor(driver) {
    this.driver = driver;
  }
    get newTagButton() {
      return this.driver.$("a[href='#/tags/new/']");
      //return this.driver.$("a[href='#/editor/page/']");
    }

    get newPageButton() {
      return this.driver.$("a[href='#/editor/page/']");
    }
    
    get editorContainerName() {
      return this.driver.$("#tag-name");
    }

    get editorContainerSlug() {
      return this.driver.$("#tag-slug");
    }

    get editorContainerDescription() {
      return this.driver.$("#tag-description");
    }
    
  get saveTag() {      
      return this.driver.$(".gh-btn.gh-btn-blue.gh-btn-icon.ember-view");
  }

  get editorSettingsButton() {
    return this.driver.$("button[title='Settings']");
  }
    async createTag(name, slug, description) {
      await this.newTagButton.click();
      await this.editorContainerName.setValue(name);
      await this.editorContainerSlug.setValue(slug);
      await this.editorContainerDescription.setValue(description);
    }

    async saveNewTag() {
      await this.saveTag.click();
    }

    async tagInList(name) {
      await this.driver.$(".gh-list").waitForExist();
  
      let pageElements = await this.driver.$$(
        "li.gh-list-row.gh-tags-list-item"         
      );
  
      let pageFinded;
  
      for (let i = 0; i < pageElements.length; i++) {
        let pageText = await pageElements[i].getText();
        if (pageText.includes(name)) {
          pageFinded = pageElements[i];
          break;
        }
      }
      return pageFinded;
    }

    async editTag(name) {
      await this.editorContainerName.setValue(name);
    }
}

module.exports = TagSection;