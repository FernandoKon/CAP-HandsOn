sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.lab2dev.gamesreview',
            componentId: 'GamesObjectPage',
            contextPath: '/Games'
        },
        CustomPageDefinitions
    );
});