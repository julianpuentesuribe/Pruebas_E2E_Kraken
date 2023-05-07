const { Given, When, Then } = require("@cucumber/cucumber");
const LoginPage = require("../../UI elements/loginPage");
const AdminMenu = require("../../UI elements/adminMenu");
const PageSection = require("../../UI elements/pagesSection");
const PostSection = require("../../UI elements/postsSection");
const TagSection = require("../../UI elements/tagsSection");
const StaffSection = require("../../UI elements/staffSection");
const DesignSection = require("../../UI elements/designSection");
const Site = require("../../UI elements/site");

let loginPage = new LoginPage();
let adminMenu = new AdminMenu();
let pagesSection = new PageSection();
let postsSection = new PostSection();
let tagsSection = new TagSection();
let staffSection = new StaffSection();
let designSection = new DesignSection();
let site = new Site();
let currentPageUrl;

Given("I navigate to page Ghost {kraken-string}", async function (url) {
  await this.driver.navigateTo(url);
});

Given(
  "I login with username {kraken-string} and password {kraken-string}",
  async function (email, password) {
    loginPage = new LoginPage(this.driver);
    adminMenu = new AdminMenu(this.driver);
    pagesSection = new PageSection(this.driver);
    postsSection = new PostSection(this.driver);
    tagsSection = new TagSection(this.driver);
    staffSection = new StaffSection(this.driver);
    designSection = new DesignSection(this.driver);
    site = new Site(this.driver);
    await loginPage.usernameInput.setValue(email);
    await loginPage.passwordInput.setValue(password);
    await loginPage.submitButton.click();
  }
);

Given("I go to pages tab", async function () {
  await adminMenu.pageTab.click();
});

Given("I go to staff tab", async function () {
  await adminMenu.staffTab.click();
});

When(
  "I select the Ghost user",
  async function () {
    const ghostUser = await staffSection.defaultGhostUser;
    await ghostUser.click()
  }
);

When(
  "I change role to Contributor",
  async function () {
    await staffSection.changeRole(3);
  }
);

When(
  "I save the user",
  async function () {
    await staffSection.saveUser();
  }
);

Then('I go back to staff list', async function () {
  const backButton = await staffSection.goBackToStaffList;
  await this.driver.execute((el) => el.click(), backButton);
  return backButton.click();
})

Then('I verify that the role tag is Contributor', async function () {
  const ghostUser = await staffSection.defaultGhostUser;
  const userBadge = await ghostUser.$(".gh-badge")
  const badgeText = await userBadge.getText()
  if (badgeText !== "CONTRIBUTOR") {
    throw new Error(
      `The new role for the Ghost user is not Contributor"`
    );
  }
  await ghostUser.click()
  await staffSection.changeRole(2);
  await staffSection.saveUser();
})

Given('I go to design tab', async function () {
  await adminMenu.designTab.click();
});

When(
  "I create a new navigation item with the label {kraken-string} and url {kraken-string}",
  async function (label, url) {
    await designSection.createNav(label,url)
  }
);

When('I save the design', async function () {
  await designSection.saveDesign();
});

Then('I go to view the site', async function () {
  const siteButton = await designSection.goViewSite;
  siteButton.click()
});

Then(
  "I verify that a navigation with the label {kraken-string} and url {kraken-string} exists",
  async function (label, url) {
    const element = await site.findNavItem(url)
    if (!element) {
      throw new Error(
        `Did not find a nav link with the label "${label}" and the url "${url}" on the site`
      );
    }
  }
);

When(
  "I create a new page with title {kraken-string} and content {kraken-string}",
  async function (title, content) {
    await pagesSection.createPage(title, content);
  }
);

When("I publish the current page", async function () {
  await pagesSection.publishPage();
  await new Promise((resolve) => setTimeout(resolve, 4000));
  currentPageUrl = await pagesSection.getPageUrl();
});

When(
  "I select a page in the list with title {kraken-string}",
  async function (title) {
    console.log(
      "-------------------------------------SELECT IN PAGE LIST-----------------------------------------"
    );
    console.log(
      "----------------------------------------------------------------------------------------------"
    );
    const pageRow = await pagesSection.pageInList(title);
    pageRow.click();
  }
);

When(
  "I select a post in the list with title {kraken-string}",
  async function (title) {
    const postRow = await postsSection.postInList(title);
    postRow.click();
  }
);

When("I edit page content with {kraken-string}", async function (content) {
  const pageBody = await pagesSection.editorContainerBody;
  await pageBody.click();
  await pageBody.keys(["Control", "a", "Backspace"]); // se borra el contenido que habia antes
  await new Promise((resolve) => setTimeout(resolve, 1000));
  await pageBody.setValue(content);
});

When("I edit post content with {kraken-string}", async function (content) {
  const postBody = await postsSection.editorContainerBody;
  await postBody.click();
  await new Promise((resolve) => setTimeout(resolve, 1000));
  await postBody.setValue(content);
});

When("I edit page title with {kraken-string}", async function (title) {
  const pageTitle = await pagesSection.editorContainerTitle;
  await pageTitle.click();
  await pageTitle.keys(["Control", "a", "Backspace"]); // se borra el título que habia antes
  await new Promise((resolve) => setTimeout(resolve, 1000));
  await pageTitle.setValue(title);
});

When("I edit post title with {kraken-string}", async function (title) {
  const postTitle = await postsSection.editorContainerTitle;
  await postTitle.click();
  await new Promise((resolve) => setTimeout(resolve, 1000));
  await postTitle.setValue(title);
});

When("I update page", async function () {
  await pagesSection.updatePage();
  await new Promise((resolve) => setTimeout(resolve, 4000));
  currentPageUrl = await pagesSection.getPageUrl();
});

When("I update post", async function () {
  await postsSection.updatePost();
  await new Promise((resolve) => setTimeout(resolve, 4000));
  currentPageUrl = await postsSection.getPostUrl();
});

When("I delete the page", async function () {
  await pagesSection.deletePage();
});

When("I delete the post", async function () {
  await postsSection.deletePost();
});

Then("I go back to page list", async function () {
  const backButton = await pagesSection.goBackToPagesSection;
  await this.driver.execute((el) => el.click(), backButton);
  return backButton.click();
});

Then(
  "I verify that the page with title {kraken-string} is on the page list",
  async function (title) {
    await pagesSection.pageInList(title);
  }
);

Then(
  "I verify that the page with title {kraken-string} is available in the webpage",
  async function (title) {
    await this.driver.navigateTo(currentPageUrl);
    await new Promise((resolve) => setTimeout(resolve, 1000));
    const pageTitle = await site.pageTitle.getText();
    if (pageTitle !== title) {
      throw new Error(
        `The title "${title}" does not match with the page title "${pageTitle}"`
      );
    }
  }
);

Then(
  "I verify that the page with title {kraken-string} has {string} status",
  async function (title, status) {
    status = status.toLowerCase();
    const pageRow = await pagesSection.pageInList(title);
    const pageRowText = await pageRow.getText();
    if (!pageRowText.toLowerCase().includes(status)) {
      throw new Error(
        `The page with title "${title}" doesn't have "${status}" status`
      );
    }
  }
);

Then(
  "I verify that the edited content {kraken-string}{kraken-string} appeared on the website",
  async function (oldcontent,content) {
    await this.driver.navigateTo(currentPageUrl);
    await new Promise((resolve) => setTimeout(resolve, 1000));
    const pageContent = await site.pageContent.getText();
    if (pageContent === oldcontent+content) {
      throw new Error(
        `The content "${content}" does not match with the page content "${pageContent}"`
      );
    }
  }
);

Then(
  "I verify that the edited title {kraken-string} appeared on the website",
  async function (content) {
    await this.driver.navigateTo(currentPageUrl);
    await new Promise((resolve) => setTimeout(resolve, 1000));
    const pageTitle = await site.pageTitle.getText();
    if (pageTitle !== content) {
      throw new Error(
        `The title "${content}" does not match with the page title "${pageTitle}"`
      );
    }
  }
);

Then(
  "I verify page with title {kraken-string} is not on the page list",
  async function (title) {
    const pageInList = await pagesSection.pageInList(title);
    if (pageInList != undefined) {
      throw new Error(
        `The page with title "${title}" still appears in pages list."`
      );
    }
  }
);

Then(
  "I verify post with title {kraken-string} is not on the post list",
  async function (title) {
    const postInList = await postsSection.postInList(title);
    if (postInList != undefined) {
      throw new Error(
        `The post with title "${title}" still appears in posts list."`
      );
    }
  }
);

Then(
  "I verify that the page is not available in the webpage",
  async function () {
    await this.driver.navigateTo(currentPageUrl);
    await site.page404.waitForExist();
  }
);

Given("I go to posts tab", async function () {
  await adminMenu.postTab.click();
});

When(
  "I create a new post with title {kraken-string} and content {kraken-string}",
  async function (title, content) {
    await postsSection.createPost(title, content);
  }
);

When("I publish the current post", async function () {
  await postsSection.publishPost();
  await new Promise((resolve) => setTimeout(resolve, 4000));
  currentPageUrl = await postsSection.getPostUrl();
});

Then("I go back to post list", async function () {
  const backButton = await postsSection.goBackToPostsSection;
  await this.driver.execute((el) => el.click(), backButton);
  return backButton.click();
});

Then(
  "I verify that the post with title {kraken-string} is available in the webpage",
  async function (title) {
    await this.driver.navigateTo(currentPageUrl);
    await new Promise((resolve) => setTimeout(resolve, 1000));
    const postTitle = await site.pageTitle.getText();
    if (postTitle !== title) {
      throw new Error(
        `The post title "${title}" does not match the h1 text "${postTitle}"`



      );
    }
  }
);

Then(
  "I verify that the post with title {kraken-string} has {string} status",
  async function (title, status) {
    status = status.toLowerCase();
    const postRow = await postsSection.postInList(title);
    const postRowText = await postRow.getText();
    if (!postRowText.toLowerCase().includes(status)) {
      throw new Error(
        `The post with title "${title}" doesn't have "${status}" status`
      );
    }
  }
);

Then(
  "I verify that the post with title {kraken-string} is on the post list",
  async function (title) {
    await postsSection.postInList(title);

  }
);

Given("I go to tags tab", async function () {
  await adminMenu.tagTab.click();
});

When(
  "I create a new tag with name {kraken-string}, slug {kraken-string} and description {kraken-string}",
  async function (name, slug, description) {
    await tagsSection.createTag(name, slug, description);
  }
);

When("I save tha tag", async function () {
  await tagsSection.saveNewTag();
});

When(
  "I select a tag in the list with name {kraken-string}",
  async function (name) {
    const tagRow = await tagsSection.tagInList(name);
    tagRow.click();
  }
);

When(
  "I edit tag name {kraken-string}",
  async function (name) {
    await tagsSection.editTag(name);
  }
);

When(
  "I delete tag",
  async function () {
    await tagsSection.deleteTag();
  }
);

Then(
  "I verify tag with title {kraken-string} is not on the tag list",
  async function (title) {
    const pageInList = await tagsSection.tagInList(title);
    if (pageInList != undefined) {
      throw new Error(
        `The page with title "${title}" still appears in pages list."`
      );
    }
  }
);

When(
  "I change password {kraken-string}",
  async function (password) {    
    await staffSection.changePass(password);
  }
);
 
When("I sign out {kraken-string}", async function (url) {    
  await this.driver.navigateTo(url + '#/signout/');
  }
);
