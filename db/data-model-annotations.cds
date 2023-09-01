using from './data-model';

annotate fullstack_dev_challenge.Tests with @(
    title             : '{i18n>Tests}',
    Common.Label      : '{i18n>Tests}',
    cds.odata.valuelist,
    Common.SemanticKey: [title]
) {
    ID          @(Common.Text: title);
    description @(title: '{i18n>desc}');
    title       @(
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

annotate fullstack_dev_challenge.Questions with @(
    title             : '{i18n>Questions}',
    Common.Label      : '{i18n>Questions',
    cds.odata.valuelist,
    Common.SemanticKey: [text]
) {
    ID   @(Common.Text: text);
    text @(
        title                          : '{i18n>questionText}',
        Common.ValueListWithFixedValues: false,
        Common.ValueList               : {
            CollectionPath: 'Questions',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: 'text',
                ValueListProperty: 'text'
            }]
        }
    )
};

annotate fullstack_dev_challenge.Answers with @(
    title             : '{i18n>Answers}',
    Common.Label      : '{i18n>Answers',
    cds.odata.valuelist,
    Common.SemanticKey: [text]
) {
    ID   @(Common.Text: text);
    text @(title: '{i18n>answerText}')
};
