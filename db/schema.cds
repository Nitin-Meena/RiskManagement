namespace demo;

using { buspart_apihub } from '../srv/external/buspart_apihub.cds';

using
{
    Country,
    Currency,
    Language,
    User,
    cuid,
    managed,
    temporal
}
from '@sap/cds/common';

entity Risks : managed
{
    key ID : UUID;
    title : String(100);
    prio : String(5);
    impact : Integer;
    criticality : Integer;
    descr : String(100);
    miti : Association to one Mitigations;
    supplier : Association to one buspart_apihub.A_BusinessPartner;
}

entity Mitigations : managed
{
    key ID : UUID;
    description : String(100);
    owner : String(100);
    timeline : String(100);
    risks : Association to one Risks;
    risks1 : Association to many Risks on risks1.miti = $self;
}
