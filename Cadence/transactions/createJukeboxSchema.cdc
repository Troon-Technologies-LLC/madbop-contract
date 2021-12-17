import NFTContract from  0x01cf0e2f2f715450

transaction (){

      prepare(acct: AuthAccount) {

            let actorResource = acct.getCapability
                  <&{NFTContract.NFTMethodsCapability}>
                  (/private/NFTMethodsCapability)
                  .borrow() ?? 
                  panic("could not borrow a reference to the NFTMethodsCapability interface")


            let format : {String: NFTContract.SchemaType} = {
                  "image" : NFTContract.SchemaType.String,
                  "title"  :  NFTContract.SchemaType.String,
                  "startDate":NFTContract.SchemaType.Fix64,
                  "endDate":  NFTContract.SchemaType.Fix64,
                  "cost":  NFTContract.SchemaType.Fix64,
                  "artistName":  NFTContract.SchemaType.String,
                  "artistDescription":  NFTContract.SchemaType.String,
                  "nftTemplates":  NFTContract.SchemaType.Array
            }

            actorResource.createSchema(schemaName: "jukebox-series-", format: format, author: 0xf3fcd2c1a78f5eee)
            log("schema created")
      }
}

