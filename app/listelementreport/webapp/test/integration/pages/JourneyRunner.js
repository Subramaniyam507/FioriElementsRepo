sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/list/listelementreport/test/integration/pages/CompaniesList",
	"com/list/listelementreport/test/integration/pages/CompaniesObjectPage"
], function (JourneyRunner, CompaniesList, CompaniesObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/list/listelementreport') + '/test/flp.html#app-preview',
        pages: {
			onTheCompaniesList: CompaniesList,
			onTheCompaniesObjectPage: CompaniesObjectPage
        },
        async: true
    });

    return runner;
});

