import NFTContract from  0xd4221a1979538992
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

            actorResource.createSchema(schemaName: "nft-series", format: format, author: 0xa888f479b6525db2)
            log("schema created")
      }
}