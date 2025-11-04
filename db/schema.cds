namespace com.epms;

using { cuid, managed } from '@sap/cds/common';

entity Company : cuid, managed {
  name          : String(100);
  country       : String(3);
  currency      : String(5);
  companyCode   : String(10);
  plants        : Composition of many Plant on plants.company = $self;
  vendors       : Composition of many Vendor on vendors.company = $self;
  materialGroups: Composition of many MaterialGroup on materialGroups.company = $self;
}

entity Plant : cuid, managed {
  plantCode     : String(10);
  name          : String(100);
  location      : String(100);
  company       : Association to Company;
  storageLocs   : Composition of many StorageLocation on storageLocs.plant = $self;
  purchaseOrders: Composition of many PurchaseOrder on purchaseOrders.plant = $self;
}

entity StorageLocation : cuid, managed {
  slocCode : String(10);
  name     : String(100);
  plant    : Association to Plant;
}

entity Vendor : cuid, managed {
  vendorCode   : String(10);
  name         : String(100);
  country      : String(3);
  email        : String(100);
  company      : Association to Company;
  contacts     : Composition of many VendorContact on contacts.vendor = $self;
}

entity VendorContact : cuid {
  name    : String(50);
  phone   : String(20);
  email   : String(100);
  vendor  : Association to Vendor;
}

entity MaterialGroup : cuid {
  groupCode  : String(10);
  description: String(100);
  company    : Association to Company;
  materials  : Composition of many Material on materials.matGroup = $self;
}

entity Material : cuid {
  materialCode : String(18);
  description  : String(255);
  unit         : String(3);
  price        : Decimal(15,2);
  currency     : String(5);
  matGroup     : Association to MaterialGroup;
}

entity PurchaseRequisition : cuid, managed {
  reqNumber : String(20);
  createdBy : String(50);
  status    : String(20); // Draft, Approved, Rejected
  company   : Association to Company;
  items     : Composition of many PRItem on items.pr = $self;
}

entity PRItem : cuid {
  itemNo    : Integer;
  material  : Association to Material;
  quantity  : Decimal(13,3);
  plant     : Association to Plant;
  deliveryDate: Date;
  status    : String(20);
  pr        : Association to PurchaseRequisition;
}

entity PurchaseOrder : cuid, managed {
  poNumber  : String(20);
  vendor    : Association to Vendor;
  company   : Association to Company;
  plant     : Association to Plant;
  status    : String(20); // Created, Approved, Received, Invoiced
  totalValue: Decimal(15,2);
  currency  : String(5);
  items     : Composition of many PurchaseOrderItem on items.po = $self;
}

entity PurchaseOrderItem : cuid {
  itemNo     : Integer;
  material   : Association to Material;
  quantity   : Decimal(13,3);
  price      : Decimal(15,2);
  currency   : String(5);
  deliveryDate : Date;
  status     : String(20);
  po         : Association to PurchaseOrder;
  receipts   : Composition of many GoodsReceipt on receipts.poItem = $self;
  invoices   : Composition of many Invoice on invoices.poItem = $self;
}

entity GoodsReceipt : cuid, managed {
  grNumber   : String(20);
  grDate     : Date;
  receivedQty: Decimal(13,3);
  poItem     : Association to PurchaseOrderItem;
  plant      : Association to Plant;
  storageLoc : Association to StorageLocation;
  status     : String(20);
}

entity Invoice : cuid, managed {
  invoiceNumber : String(20);
  poItem        : Association to PurchaseOrderItem;
  invoiceDate   : Date;
  amount        : Decimal(15,2);
  currency      : String(5);
  taxAmount     : Decimal(15,2);
  totalAmount   : Decimal(15,2);
  status        : String(20); // Draft, Approved, Posted, Paid
  approvedBy    : String(50);
  postedFlag    : Boolean default false;
}
