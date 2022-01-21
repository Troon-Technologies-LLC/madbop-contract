import NFTContractV01 from "./../contracts/NFTContractV01.cdc"
import NonFungibleToken from "./../contracts/NonFungibleToken.cdc"
transaction(brandId:UInt64, schemaId:UInt64, maxSupply:UInt64) {

        prepare(acct: AuthAccount) {
        


        let actorResource = acct.getCapability
            <&{NFTContractV01.NFTMethodsCapability}>
            (NFTContractV01.NFTMethodsCapabilityPrivatePath)
            .borrow() ?? 
            panic("could not borrow a reference to the NFTMethodsCapability interface")
            let nftTemplateIds : [AnyStruct] = [1]

        let immutableData : {String: AnyStruct} = {
            "image" : "https://troontechnologies.com",
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