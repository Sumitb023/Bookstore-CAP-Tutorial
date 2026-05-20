using CatalogService as service from '../../srv/cat-service';

annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Title}',
                Value: title,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Stock}',
                Value: stock,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Gernre}',
                Value: gernre,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Publishedat}',
                Value: publishedAt,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Pages}',
                Value: pages,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Price}',
                Value: price,
            },
        ],
    },
    UI.Facets                    : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : '{i18n>GeneralInformation}',
        Target: '@UI.FieldGroup#GeneratedGroup',
    }, ],
    UI.LineItem                  : [
        {
            $Type: 'UI.DataField',
            Label: '{i18n>Title}',
            Value: title,
        },
        {
            $Type : 'UI.DataField',
            Value : price,
            Label : '{i18n>Price}',
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>Gernre}',
            Value: gernre,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>Pages}',
            Value: pages,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>Publishedat}',
            Value: publishedAt,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>Stock}',
            Value: stock,
        },
        {
            $Type: 'UI.DataField',
            Value: createdAt,
            Label : '{i18n>CreatedAt}',
        },
    ],
    UI.SelectionFields           : [price, ],
);

annotate service.Books with {
    author @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Authors',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: author_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name',
            },
        ],
    }
};

annotate service.Books with {
    price @Common.Label: '{i18n>Price}'
};
