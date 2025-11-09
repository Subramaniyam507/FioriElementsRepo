import {ApplicationService,Request} from '@sap/cds';

module.exports = (srv:ApplicationService)=>{


  let { Vendors} = srv.entities
    srv.on('viewVendorMaster',Vendors     ,async(req:Request)=>{
              let data = await srv.run(req.query);
              return data
    })
}