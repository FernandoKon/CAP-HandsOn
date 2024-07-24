sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/lab2dev/gamesreview/test/integration/FirstJourney',
		'com/lab2dev/gamesreview/test/integration/pages/GamesList',
		'com/lab2dev/gamesreview/test/integration/pages/GamesObjectPage'
    ],
    function(JourneyRunner, opaJourney, GamesList, GamesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/lab2dev/gamesreview') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheGamesList: GamesList,
					onTheGamesObjectPage: GamesObjectPage
                }
            },
            opaJourney.run
        );
    }
);