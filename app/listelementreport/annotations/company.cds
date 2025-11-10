using ProcurementService as service from '../../../srv/epms';
annotate service.Companies with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Name}',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Country1}',
            Value : country,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Currency}',
            Value : currency,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>CompanyCode}',
            Value : companyCode,
        },
    ],
    UI.SelectionFields : [
        companyCode,
        country,
        currency,
        ID,
        name,
    ],
    UI.PresentationVariant #vh_Companies_companyCode : {
        $Type : 'UI.PresentationVariantType',
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : companyCode,
                Descending : false,
            },
        ],
    },
    UI.DataPoint #companyCode : {
        $Type : 'UI.DataPointType',
        Value : companyCode,
        Title : '{i18n>Companycode}',
    },
    UI.DataPoint #country : {
        $Type : 'UI.DataPointType',
        Value : country,
        Title : '{i18n>Country1}',
    },
);
// F4 HELP
annotate service.Companies with {
    companyCode @(
        Common.Label : '{i18n>Companycode}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Companies',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : companyCode,
                    ValueListProperty : 'companyCode',
                },
            ],
            Label : '{i18n>CompanyCode}',
            PresentationVariantQualifier : 'vh_Companies_companyCode',
            @Common.QuickInfo : '',
        },
        Common.ValueListWithFixedValues : false,
    )
};

annotate service.Companies with {
    country @Common.Label : '{i18n>Country1}'
};

annotate service.Companies with {
    currency @Common.Label : '{i18n>Currency}'
};

annotate service.Companies with {
    ID @Common.Label : '{i18n>Id}'
};

annotate service.Companies with {
    name @Common.Label : '{i18n>Name}'
};













annotate service.Vendors with @(
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'companyCode',
            Target : 'company/@UI.DataPoint#companyCode',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'country',
            Target : 'company/@UI.DataPoint#country',
        },
    ],
    UI.LineItem:[
      {
            $Type : 'UI.DataField',
            Label : 'Vendor Code',
            Value : vendorCode,
        },
       {
            $Type : 'UI.DataField',
            Label : 'Vendor Country',
            Value : country,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Vendor Name',
            Value : name,
        },
        {
             $Type : 'UI.DataField',
            Label : 'Vendor Email',
            Value : email,
        }

    ]
);

