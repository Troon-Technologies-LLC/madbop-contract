import NFTContract from  0xc3efbc9926eb00eb
import NonFungibleToken from 0x631e88ae7f1d7c20
transaction() {

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
        actorResource.createTemplate(brandId: 5, schemaId: 6, maxSupply: 100, immutableData: immutableData)
        log("Template created")
    }
}