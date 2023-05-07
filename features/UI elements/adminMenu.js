class AdminMenu {
  constructor(driver) {
    this.driver = driver;
  }
  get pageTab() {
    return this.driver.$("a[href='#/pages/']");
  }
  get postTab() {
    return this.driver.$("a[href='#/posts/']");
  }
  get tagTab() {
    return this.driver.$("a[href='#/tags/']");
  }
}

module.exports = AdminMenu;
