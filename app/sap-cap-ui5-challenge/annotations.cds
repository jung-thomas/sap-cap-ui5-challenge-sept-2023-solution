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

annotate service.Tests with @(
    UI.FieldGroup #GeneratedGroup1: {
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
            }
        ],
    },
    UI.Facets                     : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : '{i18n>testDetails}',
        Target: '@UI.FieldGroup#GeneratedGroup1',
    }, ]
);

annotate service.Tests with @(
    UI.HeaderInfo : {
        $Type : 'UI.HeaderInfoType',
        TypeName : '{i18n>test}',
        TypeNamePlural : '{i18n>tests}',
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : description,
        }
    }
);
