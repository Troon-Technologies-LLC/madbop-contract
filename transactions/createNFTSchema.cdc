import MadbopNFTs from 0x179b6b1cb6755e31
transaction (schemaName:String){

      prepare(acct: AuthAccount) {

            let actorResource = acct.getCapability
                  <&{MadbopNFTs.NFTMethodsCapability}>
                  (MadbopNFTs.NFTMethodsCapabilityPrivatePath)
                  .borrow() ?? 
                  panic("could not borrow a reference to the NFTMethodsCapability interface")


            let format : {String: MadbopNFTs.SchemaType} = {
            "nftContent" : MadbopNFTs.SchemaType.String,
            "contentType"  :  MadbopNFTs.SchemaType.String,
            "title":MadbopNFTs.SchemaType.String,
            "about":  MadbopNFTs.SchemaType.String,
            "nftCover":  MadbopNFTs.SchemaType.String
            }

            actorResource.createSchema(schemaName: schemaName, format: format)
            log("schema created")
      }
}