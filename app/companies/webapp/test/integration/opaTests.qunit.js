sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com//companies/test/integration/FirstJourney',
		'com//companies/test/integration/pages/CompaniesList',
		'com//companies/test/integration/pages/CompaniesObjectPage',
		'com//companies/test/integration/pages/GamesObjectPage'
    ],
    function(JourneyRunner, opaJourney, CompaniesList, CompaniesObjectPage, GamesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com//companies') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCompaniesList: CompaniesList,
					onTheCompaniesObjectPage: CompaniesObjectPage,
					onTheGamesObjectPage: GamesObjectPage
                }
            },
            opaJourney.run
        );
    }
);