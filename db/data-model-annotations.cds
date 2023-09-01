using from './data-model';

annotate fullstack_dev_challenge.Tests with @(
    title             : '{i18n>Tests}',
    Common.Label      : '{i18n>Tests}',
    cds.odata.valuelist,
    Common.SemanticKey: [title]
) {
    ID    @(Common.Text: title);
    description  @(title : '{i18n>desc}');
    title @(
        title                          : '{i18n>title}',
        Common.ValueListWithFixedValues: false,
        Common.ValueList               : {
            CollectionPath: 'Tests',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: 'title',
                ValueListProperty: 'title'
            }]
        }
    )
};
