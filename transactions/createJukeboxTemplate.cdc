import MadbopNFTs from 0x179b6b1cb6755e31
transaction(brandId:UInt64, schemaId:UInt64, maxSupply:UInt64) {

        prepare(acct: AuthAccount) {
        
        let actorResource = acct.getCapability
            <&{MadbopNFTs.NFTMethodsCapability}>
            (MadbopNFTs.NFTMethodsCapabilityPrivatePath)
            .borrow() ?? 
            panic("could not borrow a reference to the NFTMethodsCapability interface")
            let nftTemplateIds : [AnyStruct] = [4]

        let immutableData : {String: AnyStruct} = {
            "image" : "https://madbop.com",
            "title":"First NFT",
            "startDate":  1641199919.0 as Fix64,
            "endDate":   1642299919.0 as Fix64,
            "cost":  30.0 as Fix64,
            "artistName":  " Irfan",
            "artistDescription": "irfan is a music artist",
            "nftTemplates": nftTemplateIds      
        }
        actorResource.createTemplate(brandId: brandId, schemaId: schemaId, maxSupply: maxSupply, immutableData: immutableData)
        log("Template created")
    }
}