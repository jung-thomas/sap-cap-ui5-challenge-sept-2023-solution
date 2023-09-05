sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'questionsmaintenance/test/integration/FirstJourney',
		'questionsmaintenance/test/integration/pages/QuestionMaintenanceList',
		'questionsmaintenance/test/integration/pages/QuestionMaintenanceObjectPage'
    ],
    function(JourneyRunner, opaJourney, QuestionMaintenanceList, QuestionMaintenanceObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('questionsmaintenance') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheQuestionMaintenanceList: QuestionMaintenanceList,
					onTheQuestionMaintenanceObjectPage: QuestionMaintenanceObjectPage
                }
            },
            opaJourney.run
        );
    }
);