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
                  "image" : NFTContractV01.SchemaType.String,
                  "title"  :  NFTContractV01.SchemaType.String,
                  "startDate":NFTContractV01.SchemaType.Fix64,
                  "endDate":  NFTContractV01.SchemaType.Fix64,
                  "cost":  NFTContractV01.SchemaType.Fix64,
                  "artistName":  NFTContractV01.SchemaType.String,
                  "artistDescription":  NFTContractV01.SchemaType.String,
                  "nftTemplates":  NFTContractV01.SchemaType.Array
            }

            actorResource.createSchema(schemaName: schemaName, format: format)
            log("schema created")
      }
}

