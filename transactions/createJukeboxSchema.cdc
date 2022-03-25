import MadbopNFTs from 0xa8185ff2f21792f2
import NonFungibleToken from 0x1d7e57aa55817448

transaction (schemaName:String){

      prepare(acct: AuthAccount) {

            let actorResource = acct.getCapability
                  <&{MadbopNFTs.NFTMethodsCapability}>
                  (MadbopNFTs.NFTMethodsCapabilityPrivatePath)
                  .borrow() ?? 
                  panic("could not borrow a reference to the NFTMethodsCapability interface")


            let format : {String: MadbopNFTs.SchemaType} = {
                  "image" : MadbopNFTs.SchemaType.String,
                  "title"  :  MadbopNFTs.SchemaType.String,
                  "startDate":MadbopNFTs.SchemaType.Fix64,
                  "endDate":  MadbopNFTs.SchemaType.Fix64,
                  "cost":  MadbopNFTs.SchemaType.Fix64,
                  "artistName":  MadbopNFTs.SchemaType.String,
                  "artistDescription":  MadbopNFTs.SchemaType.String,
                  "nftTemplates":  MadbopNFTs.SchemaType.Array
            }

            actorResource.createSchema(schemaName: schemaName, format: format)
            log("schema created")
      }
}

