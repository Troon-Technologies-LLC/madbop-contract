import NFTContract from  0xc3efbc9926eb00eb
import NonFungibleToken from 0x631e88ae7f1d7c20
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

            actorResource.createSchema(schemaName: "nft-series", format: format, author: 0x7108ffbc084287e4)
            log("schema created")
      }
}