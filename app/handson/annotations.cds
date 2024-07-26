using AdminService as service from '../../srv/admin-service';
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
    typeOf @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'TypeOf',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : typeOf_ID,
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

