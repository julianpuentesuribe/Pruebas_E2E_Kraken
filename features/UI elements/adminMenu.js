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
  get staffTab() {
    return this.driver.$("a[href='#/staff/']");
  }
  get designTab() {
    return this.driver.$("a[href='#/settings/design/']");
  }
    get tagTab() {
    return this.driver.$("a[href='#/tags/']");
  }
}

module.exports = AdminMenu;
