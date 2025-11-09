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
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ProcurementService.viewVendorMaster',
            Label : '{i18n>ViewVendorMaster}',
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

