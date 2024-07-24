using db.gamespace as db from '../db/schema';

service AdminService {
    @cds.redirection.target
    entity Games as projection on db.Games {
        *,
        title,
        company,
        typeOf,
        price,
        genre,
        review
    } excluding {
        createdAt,
        createdBy,
        modifiedAt,
        modifiedBy
    };

    @readonly entity Companies as projection on db.Companies;

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

annotate AdminService.Games with @odata.draft.enabled;

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
                $Type : 'UI.DataField',
                Value : review,
            },
        ],
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Jogo',
            TypeNamePlural : 'Jogos',
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
                Label : 'Notas',
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
