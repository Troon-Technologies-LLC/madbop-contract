import NFTContract from "./../contracts/NFTContract.cdc"
import NonFungibleToken from "./../contracts/NonFungibleToken.cdc"

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

            actorResource.createSchema(schemaName: "jukebox-series-", format: format, author: 0x7108ffbc084287e4)
            log("schema created")
      }
}

