import NFTContract from  0x01cf0e2f2f715450
transaction (){

      prepare(acct: AuthAccount) {

            let actorResource = acct.getCapability
                  <&{NFTContract.NFTMethodsCapability}>
                  (/private/NFTMethodsCapability)
                  .borrow() ?? 
                  panic("could not borrow a reference to the NFTMethodsCapability interface")


            let format : {String: NFTContract.SchemaType} = {
            "nftContent" : NFTContract.SchemaType.String,
            "contentType"  :  NFTContract.SchemaType.String,
            "title":NFTContract.SchemaType.String,
            "about":  NFTContract.SchemaType.String,
            "nftCover":  NFTContract.SchemaType.String
            }

            actorResource.createSchema(schemaName: "nft-series", format: format, author: 0xf3fcd2c1a78f5eee)
            log("schema created")
      }
}