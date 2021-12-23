import NFTContract from "./../contracts/NFTContract.cdc"
import NonFungibleToken from "./../contracts/NonFungibleToken.cdc"
transaction() {

        prepare(acct: AuthAccount) {
        


        let actorResource = acct.getCapability
            <&{NFTContract.NFTMethodsCapability}>
            (/private/NFTMethodsCapability)
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
        actorResource.createTemplate(brandId: 1, schemaId: 2, maxSupply: 100, immutableData: immutableData)
        log("Template created")
    }
}