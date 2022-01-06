import NFTContract from "./../contracts/NFTContract.cdc"
import NonFungibleToken from "./../contracts/NonFungibleToken.cdc"
transaction(brandId:UInt64, schemaId:UInt64, maxSupply:UInt64) {

     prepare(acct: AuthAccount) {

        let actorResource = acct.getCapability
            <&{NFTContract.NFTMethodsCapability}>
            (/private/NFTMethodsCapability)
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