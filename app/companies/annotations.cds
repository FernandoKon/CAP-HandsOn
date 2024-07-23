using AdminService as service from '../../srv/admin-service';
annotate service.Companies with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : companyName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'publCountry_code',
                Value : publCountry_code,
            },
            {
                $Type : 'UI.DataField',
                Value : cnpj,
            },
            {
                $Type : 'UI.DataField',
                Value : city,
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
            Value : companyName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'publCountry_code',
            Value : publCountry_code,
        },
        {
            $Type : 'UI.DataField',
            Value : cnpj,
        },
        {
            $Type : 'UI.DataField',
            Value : city,
        },
    ],
);

