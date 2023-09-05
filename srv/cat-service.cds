using fullstack_dev_challenge as challenge from '../db/data-model';

@protocol: ['odata-v4']
service DevChallengeService @(path: 'dev-challenge') {

    @odata.draft.enabled: true
    entity Tests     as projection on challenge.Tests actions {
        action generateTestQuestions(questionsCount : Integer) returns String;
    }

    @readonly
    @cds.redirection.target
    entity Questions as projection on challenge.Questions;
    annotate Questions.answer with @readonly;
    

     @odata.draft.enabled: true
     entity QuestionMaintenance as projection on challenge.Questions;


    @readonly
    @cds.redirection.target
     entity TestMaintenance as projection on challenge.Tests;
   

}



