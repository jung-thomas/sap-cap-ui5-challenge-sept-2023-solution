using fullstack_dev_challenge as challenge from '../db/data-model';

@protocol: ['odata-v4']
service DevChallengeService @(path: 'dev-challenge') {

    @odata.draft.enabled: true
    entity Tests     as projection on challenge.Tests actions {
        action generateTestQuestions(questionsCount : Integer) returns String;
    }

    @odata.draft.enabled: true
    entity Questions as projection on challenge.Questions;

}
