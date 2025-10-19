describe('Dashboard Features', () => {
    beforeEach(() => {
        cy.fixture('admin').then((admin) => {
            cy.login(admin.username, admin.password);
        });
    });
    it('click query result', () => {
        cy.fixture('oss-config').then((ossConfig) => {
            cy.get('button#Performance').contains('Performance').realClick();
            cy.contains('button', 'Query Result', { timeout: 1000 }).realClick();
            cy.get('div.chrome-tab-title', { timeout: 10000 }).contains('Query Result').should('be.visible');
            cy.get('span.button-text', { timeout: 10000 }).contains('New Query').realClick();
            cy.get(`mat-tree-node`, { timeout: 10000 }).contains("Cell Measurement").click();
            cy.get('i.icon-angle-double-right').filter(':visible').first().should('be.visible').click();
            cy.get('span.button-text', { timeout: 10000 }).contains('Next').click();
            cy.get(`mat-tree-node`, { timeout: 10000 }).contains("Enhanced Radio Access Bearer measurements").click();
            const selectedCounters = ossConfig["Enhanced Radio Access Bearer measurements"].counters.filter(item=> item.isActive).map(item => item.name);
            const selectedKpis = ossConfig["Enhanced Radio Access Bearer measurements"].kpis.filter(item=> item.isActive).map(item => item.name);
            const allSelected = [...selectedCounters, ...selectedKpis];
            allSelected.forEach(item => {
                cy.get(`mat-list-option[title="${item} "]`).click();
            })
            cy.get('i.icon-angle-right').filter(':visible').first().should('be.visible').click();
            // cy.get('i.icon-angle-double-right').filter(':visible').first().should('be.visible').click();
            cy.get('span.button-text', { timeout: 10000 }).contains('Next').click();

            const timeMode = ossConfig.timeMode.find(item => item.isActive);
            if (timeMode.name !== "Section Time") {
                return;
            }
            const [hour1, min1] = timeMode.options.startTime.split(':')
            const [hour2, min2] = timeMode.options.endTime.split(':')
            cy.get('span.mat-radio-label-content').contains('Section Time').click();
            cy.get('widget-checkbox').first().click();
            cy.get('input#hour').eq(0).type(hour1);
            cy.get('input#min').eq(0).type(min1);
            cy.get('input#hour').eq(0).realClick({ force: true });
            cy.get('input#hour').eq(1).type(hour2);
            cy.get('input#min').eq(1).type(min2);
            cy.get('input#hour').eq(0).realClick({ force: true });


            cy.get('widget-radio', { timeout: 1000 }).get('span.mat-radio-label-content').contains('Custom').click();
            const startDate = ossConfig.dateRange.find(item => item.name === 'Custom').startDate;
            const endDate = ossConfig.dateRange.find(item => item.name === 'Custom').endDate;
            cy.get('widget-calender[label="Start Date"]').get('input.mat-input-element').eq(0).type(startDate)
            cy.get('widget-calender[label="End Date"]').get('input.mat-input-element').eq(1).type(endDate);


            cy.get('span.button-text', { timeout: 10000 }).contains('Query').click();
            // cy.intercept('POST', '/api/v1/performance-manager/report/display/table').as('getData');
            // cy.wait('@getData');
            cy.contains('No Data Available.', { timeout: 15000 }).should('not.exist');


            cy.get('widget-menu-button[label="Export"]', { timeout: 10000 }).realClick();
            cy.get('div.mat-menu-content', { timeout: 10000 }).get('.mat-menu-item').contains('All').click();
            cy.get('app-export-settings-modal', { timeout: 10000 }).get('mat-radio-button', { timeout: 1000 }).contains('CSV').click();
            cy.get('app-export-settings-modal', { timeout: 10000 }).get('widget-button[label="OK"]', { timeout: 10000 }).click();


            cy.get('span.icon-line-chart', { timeout: 1000 }).click();
            // cy.get('mat-list-option').get('h6').contains('rrc_dl_information_transfer').click();


            allSelected.forEach(c => {
                const selectedItems = cy.get('mat-list-option[aria-selected="true"]');
                if (selectedItems) {
                    cy.get('mat-list-option[aria-selected="true"]').each(($el) => {
                        cy.wrap($el).click();
                    })
                }
                cy.get('mat-list-option').get('h6').contains(c, {timeout: 20000}).click();
                const downloadName = 'chart.png';
                const timestamp = Date.now();
                const newName = `Downlink measurements-${c}-chart-${timestamp}.png`;
                cy.get('div.loading-overlay', { timeout: 20000 }).should('not.exist');
                cy.get('i.icon-download', {timeout: 20000}).click();
                cy.get('button').contains('Download PNG', {timeout: 20000}).click();
                cy.readFile(`cypress/downloads/${downloadName}`, { timeout: 15000 }).should('exist');
                cy.task('renameDownloadedFile', { oldName: downloadName, newName });
            })

        });

    })

    //   it('should display user settings', () => {
    //     cy.get('nav').contains('Settings').click();
    //     cy.contains('Account Settings').should('be.visible');
    //   });
});
