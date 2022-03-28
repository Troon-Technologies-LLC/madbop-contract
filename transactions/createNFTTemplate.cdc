import MadbopNFTs from 0x179b6b1cb6755e31
transaction(brandId:UInt64, schemaId:UInt64, maxSupply:UInt64) {

    prepare(acct: AuthAccount) {

        let actorResource = acct.getCapability
            <&{MadbopNFTs.NFTMethodsCapability}>
            (MadbopNFTs.NFTMethodsCapabilityPrivatePath)
            .borrow() ?? 
            panic("could not borrow a reference to the NFTMethodsCapability interface")


        let immutableData : {String: AnyStruct} = {
            "nftContent" : "Image",
            "contentType"  : "https://madbop.com",
            "title":"fourth NFT",
            "about":  "this is the fourth music nft",
            "nftCover": "https://madbop.com"       
        }
        actorResource.createTemplate(brandId: brandId, schemaId: schemaId, maxSupply: maxSupply, immutableData: immutableData)
        log("Template created")
    }
}