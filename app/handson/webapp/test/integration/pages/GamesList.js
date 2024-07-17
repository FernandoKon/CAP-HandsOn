sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'com.lab2dev.handson',
            componentId: 'GamesList',
            contextPath: '/Games'
        },
        CustomPageDefinitions
    );
});