using db.gamespace as db from '../db/schema';

service AdminService {
    @cds.redirection.target
    entity Games as projection on db.Games {
        *,
        company.companyName
    }; 

    @readonly entity Companies as projection on db.Companies ;

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
            companyName,
            genre,
            review
        ],
        LineItem  : [
            {
                $Type : 'UI.DataField',
                Value : review,
            },
            
        ],
    }
){
    companyName @(
        title : 'Desenvolvedora',
        Common: {
            ValueList : {
                $Type : 'Common.ValueListType',
                CollectionPath : 'Companies',
                Label : 'Desenvolvedoras',

                Parameters: [
                    {
                        $Type : 'Common.ValueListParameterInOut',
                        LocalDataProperty : companyName,
                        ValueListProperty : 'companyName',
                    },
                    {
                        $Type : 'Common.ValueListParameterInOut',
                        LocalDataProperty : company_ID,
                        ValueListProperty : 'ID',
                    },
                ]
            },
        }
    );
    title @(
        Common: {
            ValueListWithFixedValues,
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
