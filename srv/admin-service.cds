using db.gamespace as db from '../db/schema';

service AdminService {
    @cds.redirection.target
    @odata.draft.enabled
    entity Games as projection on db.Games {
        *,
        title,
        company,
        typeOf,
        price,
        genre,
        review,
    } excluding {
        createdAt,
        createdBy,
        modifiedAt,
        modifiedBy
    };

    entity Companies as projection on db.Companies;

    entity Genre as projection on db.Genre {
        *
    } excluding {
        createdAt,
        createdBy,
        modifiedAt,
        modifiedBy
    };

    entity TypeOf as projection on db.TypeOf {
        *
    } excluding {
        createdAt,
        createdBy,
        modifiedAt,
        modifiedBy
    };

    @readonly entity UniqueReviews as select from db.Games {
        review
    } group by review order by review desc;
}

annotate AdminService.Games with @(
    Capabilities : {
        InsertRestrictions : {
            $Type : 'Capabilities.InsertRestrictionsType',
            Insertable
        },
        UpdateRestrictions: {
            $Type: 'Capabilities.UpdateRestrictionsType',
            Updatable
        },
        DeleteRestrictions: {
            $Type: 'Capabilities.DeleteRestrictionsType',
            Deletable
        }
    },
    UI: {
        SelectionFields  : [
            title,
            company_ID,
            review
        ],
        LineItem  : [
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Value :  company.companyName,
            },
            {
                $Type : 'UI.DataField',
                Value : price_amount,
            },
            {
                $Type : 'UI.DataField',
                Value : price_currency_code,
            },
            {
                $Type : 'UI.DataField',
                Value : genre.type,
            },
            {
                $Type : 'UI.DataField',
                Value : typeOf.type,
            },
            {
                $Type : 'UI.DataFieldForAnnotation',
                Target : '@UI.DataPoint#Aggregated',
            },
        ],
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Jogo',
            TypeNamePlural : 'Jogos',
        },
        Facets  : [
            {
                $Type : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#GameInfo',
                ID: 'GameInfo',
                Label: 'Geral'
            },
            {
                $Type : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#CompanyInfo',
                ID: 'CompanyInfo',
                Label: 'Desenvolvedora'
            },
        ],
        FieldGroup #GameInfo : {
            $Type : 'UI.FieldGroupType',
            Data : [
                {
                    Value : title,
                },
                {
                    Value : typeOf.type,
                },
                {
                    Value : price_amount,
                },
                {
                    Value : genre.type,
                },
                {
                    $Type : 'UI.DataFieldForAnnotation',
                    Target : '@UI.DataPoint#Aggregated',
                }
            ]
        },
        FieldGroup #CompanyInfo : {
            $Type : 'UI.FieldGroupType',
            Data : [
                {
                    Value : company.companyName,
                },
                {
                    Value : company.cnpj,
                },
                {
                    Value : company.city,
                },
                {
                    Value : company.publCountry_code,
                }
            ]
        },
        DataPoint#Aggregated: {
            Title : 'Avaliação',
            Value : review,
            TargetValue : 5,
            Visualization : #Rating,
            SampleSize : review
        },
    }
){
    title @(
        Common: {
            // ValueListWithFixedValues,
            ValueList : {
                $Type : 'Common.ValueListType',
                CollectionPath : 'Games',
                Label : 'Títulos',
                Parameters: [
                    {
                        $Type : 'Common.ValueListParameterInOut',
                        LocalDataProperty : title,
                        ValueListProperty : 'title',
                    },
                ]
            },
        }
    );
    review @(
        Common: {
            ValueListWithFixedValues,
            ValueList : {
                $Type : 'Common.ValueListType',
                CollectionPath : 'UniqueReviews',
                Label : 'Avaliações',
                Parameters: [
                    {
                        $Type : 'Common.ValueListParameterInOut',
                        LocalDataProperty : review,
                        ValueListProperty : 'review',
                    },
                ]
            },
        }
    );
};
