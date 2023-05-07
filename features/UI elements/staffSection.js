class StaffSection {
  constructor(driver) {
    this.driver = driver;
  }

  get defaultGhostUser() {
    return this.driver.$("a[href='#/staff/ghost/']");
  }

  get saveButton() {
    return this.driver.$("button.gh-btn-blue");
  }

  get goBackToStaffList() {
    return this.driver.$("a[href='#/staff/']");
  }

  async changeRole(newRole) {
    const select = await this.driver.$("select#new-user-role");
    await select.selectByIndex(newRole)
  }

  async saveUser() {
    await this.saveButton.click();
  }
}

module.exports = StaffSection;
