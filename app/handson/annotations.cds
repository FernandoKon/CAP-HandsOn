using AdminService as service from '../../srv/admin-service';
annotate service.Games with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Value : genre,
            },
            {
                $Type : 'UI.DataField',
                Value : typeOf,
            },
            {
                $Type : 'UI.DataField',
                Label : 'price_amount',
                Value : price_amount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'price_currency_code',
                Value : price_currency_code,
            },
            {
                $Type : 'UI.DataField',
                Value : review,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Value : genre,
        },
        {
            $Type : 'UI.DataField',
            Value : typeOf,
        },
        {
            $Type : 'UI.DataField',
            Label : 'price_amount',
            Value : price_amount,
        },
        {
            $Type : 'UI.DataField',
            Label : 'price_currency_code',
            Value : price_currency_code,
        },
    ],
);

annotate service.Games with {
    company @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Companies',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : company_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'companyName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'publCountry_code',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'cnpj',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'city',
            },
        ],
    }
};

