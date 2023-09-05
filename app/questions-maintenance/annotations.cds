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
        Data : [
            {
                $Type: 'UI.DataField',
                Value: text,
            },
            {
                $Type: 'UI.DataField',
                Value: answer.text,
            },
        ],
    },
    UI.Facets                     : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet1',
            Label : '{i18n>Questions}',
            Target: '@UI.FieldGroup#GeneratedGroup1',
        },         
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>QuestionTranslations}',
            Target: 'texts/@UI.LineItem'
        },
                {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>AnswerTranslations}',
            Target: 'answer/texts/@UI.LineItem'
        },
    ]
);

annotate service.QuestionMaintenance with @(UI.HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>question}',
    TypeNamePlural: '{i18n>Questions}',
    Title         : {
        $Type: 'UI.DataField',
        Value: text
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: answer.text,
    }
});

annotate service.QuestionMaintenance.texts with @(UI: {
    Identification : [{Value: text}],
    SelectionFields: [
        locale,
        text
    ],
    LineItem       : [
        {
            Value: locale,
            Label: '{i18n>locale}'
        },
        {Value: text}
    ]
});

annotate service.QuestionMaintenance.texts with @(UI.HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>QuestionTranslations}',
    TypeNamePlural: '{i18n>QuestionTranslations}'
});

annotate service.QuestionMaintenance.texts with {
    ID       @UI.Hidden;
    ID_texts @UI.Hidden;
};

// Add Value Help for Locales
annotate service.QuestionMaintenance.texts {
    locale @(
        ValueList.entity: 'Languages',
        Common.ValueListWithFixedValues,
    )
}


annotate service.QuestionMaintenance.answer.texts with @(UI: {
    Identification : [{Value: text}],
    SelectionFields: [
        locale,
        text
    ],
    LineItem       : [
        {
            Value: locale,
            Label: '{i18n>locale}'
        },
        {Value: text}
    ]
});

annotate service.QuestionMaintenance.answer.texts with @(UI.HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>AnswerTranslations}',
    TypeNamePlural: '{i18n>AnswerTranslations}'
});

annotate service.QuestionMaintenance.answer.texts with {
    ID       @UI.Hidden;
    up_ @UI.Hidden;
};

// Add Value Help for Locales
annotate service.QuestionMaintenance.answer.texts {
    locale @(
        ValueList.entity: 'Languages',
        Common.ValueListWithFixedValues,
    )
}
