import NFTContractV01 from "./../contracts/NFTContractV01.cdc"
import NonFungibleToken from "./../contracts/NonFungibleToken.cdc"
transaction (schemaName:String){

      prepare(acct: AuthAccount) {

            let actorResource = acct.getCapability
                  <&{NFTContractV01.NFTMethodsCapability}>
                  (NFTContractV01.NFTMethodsCapabilityPrivatePath)
                  .borrow() ?? 
                  panic("could not borrow a reference to the NFTMethodsCapability interface")


            let format : {String: NFTContractV01.SchemaType} = {
            "nftContent" : NFTContractV01.SchemaType.String,
            "contentType"  :  NFTContractV01.SchemaType.String,
            "title":NFTContractV01.SchemaType.String,
            "about":  NFTContractV01.SchemaType.String,
            "nftCover":  NFTContractV01.SchemaType.String
            }

            actorResource.createSchema(schemaName: schemaName, format: format)
            log("schema created")
      }
}