sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'sapcapui5challenge',
            componentId: 'TestsObjectPage',
            entitySet: 'Tests'
        },
        CustomPageDefinitions
    );
});