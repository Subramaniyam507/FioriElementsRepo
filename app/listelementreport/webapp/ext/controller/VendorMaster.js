sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        /**
         * Generated event handler.
         *
         * @param oContext the context of the page on which the event was fired. `undefined` for list report page.
         * @param aSelectedContexts the selected contexts of the table rows.
         */
        onClick: function(oContext, aSelectedContexts) {
            debugger;
            let ID =   aSelectedContexts[0].getObject(aSelectedContexts[0].sPath).ID
           
            this.routing.navigateToRoute("VendorObjectPage", key:{
                company_ID: ID
            });
           
  
        }
    };
});
