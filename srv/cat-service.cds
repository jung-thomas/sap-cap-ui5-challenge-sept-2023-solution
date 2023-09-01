using fullstack_dev_challenge as challenge from '../db/data-model';


service DevChallengeService @(path: '/dev-challenge') {

    @odata.draft.enabled: true
    entity Tests     as projection on challenge.Tests actions {
        action generateTestQuestions(questionsCount : Integer) returns array of testReturn
    }

    entity Questions as projection on challenge.Questions;

    @readonly entity testReturn {
        message         : String;
        randomQuestions : Composition of many challenge.Questions;
        testQuestions   : Composition of many challenge.Tests;
    }
}
