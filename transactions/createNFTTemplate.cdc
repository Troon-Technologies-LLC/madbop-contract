import MadbopNFTs from 0xa8185ff2f21792f2
import NonFungibleToken from 0x631e88ae7f1d7c20
transaction(brandId:UInt64, schemaId:UInt64, maxSupply:UInt64) {

    prepare(acct: AuthAccount) {

        let actorResource = acct.getCapability
            <&{MadbopNFTs.NFTMethodsCapability}>
            (MadbopNFTs.NFTMethodsCapabilityPrivatePath)
            .borrow() ?? 
            panic("could not borrow a reference to the NFTMethodsCapability interface")


        let immutableData : {String: AnyStruct} = {
            "nftContent" : "Image",
            "contentType"  : "https://troontechnologies.com",
            "title":"fourth NFT",
            "about":  "this is the fourth music nft",
            "nftCover": "https://troontechnologies.com"       
        }
        actorResource.createTemplate(brandId: brandId, schemaId: schemaId, maxSupply: maxSupply, immutableData: immutableData)
        log("Template created")
    }
}