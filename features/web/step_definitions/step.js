const { Given, When, Then } = require("@cucumber/cucumber");
const LoginPage = require("../../UI elements/loginPage");
const AdminMenu = require("../../UI elements/adminMenu");
const PageSection = require("../../UI elements/pagesSection");
const Site = require("../../UI elements/site");

let loginPage;
let adminMenu;
let pagesSection;
let site;
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
    site = new Site(this.driver);
    await loginPage.usernameInput.setValue(email);
    await loginPage.passwordInput.setValue(password);
    await loginPage.submitButton.click();
  }
);

Given("I go to pages tab", async function () {
  await adminMenu.pageTab.click();
});

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

When("I edit page content with {kraken-string}", async function (content) {
  const pageBody = await pagesSection.editorContainerBody;
  await pageBody.click();
  await pageBody.keys(["Control", "a", "Backspace"]); // se borra el contenido que habia antes
  await new Promise((resolve) => setTimeout(resolve, 1000));
  await pageBody.setValue(content);
});

When("I edit page title with {kraken-string}", async function (title) {
  const pageTitle = await pagesSection.editorContainerTitle;
  await pageTitle.click();
  await pageTitle.keys(["Control", "a", "Backspace"]); // se borra el título que habia antes
  await new Promise((resolve) => setTimeout(resolve, 1000));
  await pageTitle.setValue(title);
});

When("I update page", async function () {
  await pagesSection.updatePage();
  await new Promise((resolve) => setTimeout(resolve, 4000));
  currentPageUrl = await pagesSection.getPageUrl();
});

When("I delete the page", async function () {
  await pagesSection.deletePage();
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
  "I verify that the edited content {kraken-string} appeared on the website",
  async function (content) {
    await this.driver.navigateTo(currentPageUrl);
    await new Promise((resolve) => setTimeout(resolve, 1000));
    const pageContent = await site.pageContent.getText();
    if (pageContent !== content) {
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
  "I verify that the page is not available in the webpage",
  async function () {
    await this.driver.navigateTo(currentPageUrl);
    await site.page404.waitForExist();
  }
);
