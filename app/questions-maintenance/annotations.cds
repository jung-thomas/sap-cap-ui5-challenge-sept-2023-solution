using DevChallengeService as service from '../../srv/cat-service';

annotate service.QuestionMaintenance with @(UI.PresentationVariant: {
    SortOrder     : [{Property: text}],
    Visualizations: ['@UI.LineItem']
});

annotate service.QuestionMaintenance with @(UI.SelectionFields: [
    text,
    answer.text,
    test.title
]);

annotate service.QuestionMaintenance with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: text,
    },
    {
        $Type: 'UI.DataField',
        Value: answer.text,
    },
    {
        $Type: 'UI.DataField',
        Value: test.title,
    }
]);

annotate service.QuestionMaintenance with @(
    UI.FieldGroup #GeneratedGroup1: {
        $Type: 'UI.FieldGroupType',
        Data : [{
            $Type: 'UI.DataField',
            Value: text,
        },
        {
            $Type: 'UI.DataField',
            Value: answer.text,
        },
        ],
    },
    UI.Facets                     : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : '{i18n>Questions}',
        Target: '@UI.FieldGroup#GeneratedGroup1',
    }, ]
);

annotate service.QuestionMaintenance with @(
    UI.HeaderInfo : {
        $Type : 'UI.HeaderInfoType',
        TypeName : '{i18n>question}',
        TypeNamePlural : '{i18n>Questions}',
        Title : {
            $Type : 'UI.DataField',
            Value : text
        },
        Description : {
            $Type : 'UI.DataField',
            Value : answer.text,
        }
    }
);
