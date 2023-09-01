sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'sapcapui5challenge',
            componentId: 'TestsList',
            entitySet: 'Tests'
        },
        CustomPageDefinitions
    );
});