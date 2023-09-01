sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sapcapui5challenge/test/integration/FirstJourney',
		'sapcapui5challenge/test/integration/pages/TestsList',
		'sapcapui5challenge/test/integration/pages/TestsObjectPage',
		'sapcapui5challenge/test/integration/pages/QuestionsObjectPage'
    ],
    function(JourneyRunner, opaJourney, TestsList, TestsObjectPage, QuestionsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sapcapui5challenge') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheTestsList: TestsList,
					onTheTestsObjectPage: TestsObjectPage,
					onTheQuestionsObjectPage: QuestionsObjectPage
                }
            },
            opaJourney.run
        );
    }
);