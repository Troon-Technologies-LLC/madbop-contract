import NFTContract from 0xc3efbc9926eb00eb
transaction (){

   prepare(acct: AuthAccount) {

         let actorResource = acct.getCapability
               <&{NFTContract.NFTMethodsCapability}>
               (/private/NFTMethodsCapability)
               .borrow() ?? 
               panic("could not borrow a reference to the NFTMethodsCapability interface")


         let format : {String: NFTContract.SchemaType} = {
            "contentType"  :  NFTContract.SchemaType.String,
            "nftContent" : NFTContract.SchemaType.String,
            "title":NFTContract.SchemaType.String,
            "about":  NFTContract.SchemaType.String,
            "nftCover":  NFTContract.SchemaType.String
            }

         actorResource.createSchema(schemaName: "nft-series-1", format: format, author: 0x9ddbd00b5f35899c)
   }
}