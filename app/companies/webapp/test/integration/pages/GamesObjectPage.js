sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com..companies',
            componentId: 'GamesObjectPage',
            contextPath: '/Companies/games'
        },
        CustomPageDefinitions
    );
});