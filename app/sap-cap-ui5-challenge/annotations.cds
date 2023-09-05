using DevChallengeService as service from '../../srv/cat-service';

annotate service.Tests with @(UI.PresentationVariant: {
    SortOrder     : [{Property: title}],
    Visualizations: ['@UI.LineItem']
});

annotate service.Tests with @(UI.SelectionFields: [
    title,
    description,
    createdAt,
    createdBy
]);

annotate service.Tests with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: title,
    },
    {
        $Type: 'UI.DataField',
        Value: description,
    },
    {
        $Type: 'UI.DataField',
        Value: createdBy,
    },
    {
        $Type: 'UI.DataField',
        Value: createdAt,
    }
]);

annotate service.Tests with @(UI.FieldGroup #GeneratedGroup1: {
    $Type: 'UI.FieldGroupType',
    Data : [
        {
            $Type: 'UI.DataField',
            Value: title,
        },
        {
            $Type: 'UI.DataField',
            Value: description,
        },
        {
            $Type: 'UI.DataField',
            Value: createdBy,
        },
        {
            $Type: 'UI.DataField',
            Value: createdAt,
        },
        {
            $Type: 'UI.DataField',
            Value: modifiedBy,
        },
        {
            $Type: 'UI.DataField',
            Value: modifiedAt,
        }
    ],
});

annotate service.Tests with @(UI.HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>test}',
    TypeNamePlural: '{i18n>tests}',
    Title         : {
        $Type: 'UI.DataField',
        Value: title,
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: description,
    }
});

annotate service.Questions with @(UI.LineItem: [
    {
        $Type            : 'UI.DataField',
        Value            : text,
        ![@UI.Importance]: #High,
    },
    {
        $Type            : 'UI.DataField',
        Value            : answer.text,
        ![@UI.Importance]: #High,
    },
]);

annotate service.Tests with @(UI.Facets: [
    {
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : '{i18n>testDetails}',
        Target: '@UI.FieldGroup#GeneratedGroup1',
    },
    {
        $Type : 'UI.ReferenceFacet',
        Label : '{i18n>Translations}',
        Target: 'texts/@UI.LineItem'
    },
    {
        $Type : 'UI.ReferenceFacet',
        Target: 'questions/@UI.LineItem',
        Label : '{i18n>questions}',
        ID    : 'QuestionsFacet1',
    },
]);


annotate service.Tests.texts with @(UI: {
    Identification : [{Value: title}],
    SelectionFields: [
        locale,
        title
    ],
    LineItem       : [
        {
            Value: locale,
            Label: '{i18n>locale}'
        },
        {Value: title},
        {Value: description},
    ]
});

annotate service.Tests.texts with @(UI.HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Translations}',
    TypeNamePlural: '{i18n>Translations}'
});

annotate service.Tests.texts with {
    ID       @UI.Hidden;
    ID_texts @UI.Hidden;
};

// Add Value Help for Locales
annotate service.Tests.texts {
    locale @(
        ValueList.entity: 'Languages',
        Common.ValueListWithFixedValues,
    )
}

using {sap} from '@sap/cds-common-content';

extend service service {
    @readonly
    entity Languages as projection on sap.common.Languages;
}
