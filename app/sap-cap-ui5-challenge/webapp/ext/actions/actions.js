sap.ui.define([
    "sap/m/MessageBox",
    "sap/m/MessageToast",
    "sap/ui/model/odata/v4/ODataModel",
], function (MessageBox, MessageToast, ODataModel) {
    'use strict';

    return {
        onOpenDialog: function (oEvent) {
            if (!this.pDialog) {
                this.pDialog = this.loadFragment({
                    name: "sapcapui5challenge.ext.fragment.QuestionsCountDialog",
                })
            }

            this.pDialog.then(function (oDialog) {
                oDialog.open()
            });
        },

        onCloseDialog: function (oEvent) {
            oEvent.getSource().getParent().close()
        },

        generateTestQuestions: function (oEvent) {
            if (!this.pDialog) {
                this.pDialog = this.loadFragment({
                    name: "sapcapui5challenge.ext.fragment.QuestionsCountDialog",
                })
            }
            this.pDialog.then(function (oDialog) {
                oDialog.open()
            })
        },

        onSubmitDialog: async function (oEvent) {
            oEvent.preventDefault()
            const oBindingContext = oEvent.getSource().getBindingContext()
            const dialogInputFields = oEvent.getSource().getParent().getContent()
            const questionsCount = dialogInputFields[1]._getInputValue()
            const tests = oBindingContext.getValue()

            const oModel = oBindingContext.getModel()  //, oBindingContext
            const oOperation = oModel.bindContext(`/Tests(ID=${tests.ID},IsActiveEntity=true)/DevChallengeService.generateTestQuestions(...)`)
            oOperation.setParameter("questionsCount", Number(questionsCount))
            oOperation.execute().then(async function () {
                const oResults = oOperation.getBoundContext().getObject()
                if (oResults && oResults.value[0] && oResults.value) {
                    MessageBox.information(oResults.value) 
                }
                await oBindingContext.refresh()

            }.bind(this), function (oError) {
                MessageBox.error(oError.message)
            })
            oEvent.getSource().getParent().close()
        }
    }
})
