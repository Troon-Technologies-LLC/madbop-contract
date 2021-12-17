import NFTContract from  0x01cf0e2f2f715450
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
            "title":"first NFT",
            "about":  "this is the first music nft",
            "nftCover": "https://troontechnologies.com"       
        }
        actorResource.createTemplate(brandId: 1, schemaId: 1, maxSupply: 100, immutableData: immutableData)
        log("Template created")
    }
}