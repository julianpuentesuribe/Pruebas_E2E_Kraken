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

  get editorContainerPass() {
    return this.driver.$("#user-password-new");
  }

  get editorContainerVeriPass() {
    return this.driver.$("#user-new-password-verification");
  }

  get changePassword() {      
    return this.driver.$(".gh-btn.gh-btn-icon.button-change-password.gh-btn-red.ember-view");
  }

  get editorSettingsButton() {          
    return this.driver.$('button[role="button"][class*="user-actions-cog"]');
    
  }

  get editorSuspendButton() {          
    return this.driver.$(".suspend");
  }

  get editorSuspendModalButton() {          
    return this.driver.$(".gh-btn.gh-btn-red.gh-btn-icon.ember-view");
  }  

  get buttonSignOut() {      
    return this.driver.$(".ember-view.ember-basic-dropdown-trigger.ember-basic-dropdown-trigger--left.ember-basic-dropdown-trigger--above..flex.items-center.outline-0.pointer.space-between.pa2.pl4.pr3.mt3.mb6");
  }

  async changeRole(newRole) {
    const select = await this.driver.$("select#new-user-role");
    await select.selectByIndex(newRole)
  }

  async changePass(newPass) {        
    await this.editorContainerPass.setValue(newPass);
    await this.editorContainerVeriPass.setValue(newPass);
    await this.changePassword.click();
  }

  async changeState() {            
    await this.editorSettingsButton.click();
    await this.editorSuspendButton.click();
    await this.driver.$(".modal-content").waitForExist();
    const supendButton = await this.editorSuspendModalButton;
    await this.driver.execute((el) => el.click(), supendButton);
    await supendButton.click();
  }
  
  async signOutUser() {            
    await this.buttonSignOut.click();
  }

  async saveUser() {
    await this.saveButton.click();
  }
}

module.exports = StaffSection;
