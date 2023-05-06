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

Then("I go back to page list", async function () {
  const backButton = await pagesSection.goBackToPagesSection;
  await this.driver.execute((el) => el.click(), backButton);
  return backButton.click();
});

Then(
  "I verified that the page with title {kraken-string} is on the page list",
  async function (title) {
    await pagesSection.pageInList(title);
  }
);

Then(
  "I verified that the page with title {kraken-string} is available in the webpage",
  async function (title) {
    await this.driver.navigateTo(currentPageUrl);
    await new Promise((resolve) => setTimeout(resolve, 1000));
    const pageTitle = await site.pageTitle.getText();
    if (pageTitle !== title) {
      throw new Error(
        `The page title "${title}" does not match the h1 text "${pageTitle}"`
      );
    }
  }
);

Then(
  "I verified that the page with title {kraken-string} has {string} status",
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
