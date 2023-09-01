sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        generateTestQuestions: function(oEvent) {
            MessageToast.show("Custom handler invoked.");
        }
    };
});
