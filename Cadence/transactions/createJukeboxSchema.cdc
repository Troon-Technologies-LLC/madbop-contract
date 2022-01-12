import NFTContract from "./../contracts/NFTContract.cdc"
import NonFungibleToken from "./../contracts/NonFungibleToken.cdc"

transaction (schemaName:String){

      prepare(acct: AuthAccount) {

            let actorResource = acct.getCapability
                  <&{NFTContract.NFTMethodsCapability}>
                  (NFTContract.NFTMethodsCapabilityPrivatePath)
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

            actorResource.createSchema(schemaName: schemaName, format: format)
            log("schema created")
      }
}

