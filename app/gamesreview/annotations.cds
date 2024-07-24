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
                Label : 'Preço',
                Value : price_amount,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Moeda}',
                Value : price_currency_code,
            },
            {
                $Type : 'UI.DataField',
                Value : review,
            },
            {
                $Type : 'UI.DataField',
                Value : genre.type,
            },
            {
                $Type : 'UI.DataField',
                Value : typeOf.type,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Jogo',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Desenvolvedora',
            ID : 'Desenvolvedora',
            Target : '@UI.FieldGroup#Desenvolvedora',
        },
    ]
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

annotate service.Games with {
    genre @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Genre',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : genre_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'type',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'value',
            },
        ],
    }
};

annotate service.Games with @(
    UI.FieldGroup #Desenvolvedora : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : company.companyName,
            },{
                $Type : 'UI.DataField',
                Value : company.cnpj,
            },{
                $Type : 'UI.DataField',
                Value : company.city,
            },{
                $Type : 'UI.DataField',
                Value : company.publCountry_code,
            },],
    }
);
