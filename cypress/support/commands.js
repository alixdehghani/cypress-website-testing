Cypress.Commands.add('login', (username, password) => {
    cy.visit('#/login'); // baseUrl will be prepended automatically
    cy.get('[formControlName="username"]').type(username);
    cy.get('[formControlName="password"]').type(password);
    // cy.get('[formControlName="captcha"]').type(captcha);
    cy.get('[type="submit"]').click();
    cy.url().should('include', '/#/');
    cy.contains('Welcome to Node Master', {timeout: 10000}).should('be.visible');
});
