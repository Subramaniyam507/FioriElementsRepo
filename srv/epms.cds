using {com.epms as epms} from '../db/schema';  // adjust path if needed

service ProcurementService {
  // Master Data
  entity Companies          as projection on epms.Company;
  entity Plants             as projection on epms.Plant;
  entity StorageLocations   as projection on epms.StorageLocation;
  entity Vendors            as projection on epms.Vendor;
  entity VendorContacts     as projection on epms.VendorContact;
  entity MaterialGroups     as projection on epms.MaterialGroup;
  entity Materials          as projection on epms.Material;

  // Transactional Data
  entity PurchaseRequisitions as projection on epms.PurchaseRequisition;
  entity PRItems              as projection on epms.PRItem;
  entity PurchaseOrders       as projection on epms.PurchaseOrder;
  entity PurchaseOrderItems   as projection on epms.PurchaseOrderItem;
  entity GoodsReceipts        as projection on epms.GoodsReceipt;
  entity Invoices             as projection on epms.Invoice;
}
