using { buspart_apihub } from './external/buspart_apihub.cds';

using { demo as my } from '../db/schema';

@path : '/service/RiskManagementSvcs'
service RiskManagementService
{
    annotate Mitigations with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'RiskViewer' ] },
        { grant : [ '*' ], to : [ 'RiskManager' ] }
    ];

    annotate Risks with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'RiskViewer' ] },
        { grant : [ '*' ], to : [ 'RiskManager' ] }
    ];

    @odata.draft.enabled
    entity Risks as
        projection on my.Risks;

    @odata.draft.enabled
    entity Mitigations as
        projection on my.Mitigations;

    entity A_BusinessPartner as
        projection on buspart_apihub.A_BusinessPartner
        {
            BusinessPartner,
            Customer,
            Supplier,
            BusinessPartnerCategory,
            BusinessPartnerFullName,
            BusinessPartnerIsBlocked
        };
}

annotate RiskManagementService with @requires :
[
    'authenticated-user',
    'RiskViewer',
    'RiskManager'
];
