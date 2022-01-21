import NFTContractV01 from "./../contracts/NFTContractV01.cdc"
import NonFungibleToken from "./../contracts/NonFungibleToken.cdc"
//        brandName: "Madbop ",
//        author: 0xf3fcd2c1a78f5eee,
//        data: {
//            "name":"Madbop ",
//            "description":"WE BUILD DIGITAL SOLUTIONS THAT ADVANCE,IGNITE,AND EVOLVE YOUR BUSINESS",
//            "url":"https://madbop.com/"   }

transaction (brandName:String, data:{String:String}){
  
    prepare(acct: AuthAccount) {
        let actorResource = acct.getCapability
            <&{NFTContractV01.NFTMethodsCapability}>
            (NFTContractV01.NFTMethodsCapabilityPrivatePath)
            .borrow() ?? 
            panic("could not borrow a reference to the NFTMethodsCapability interface")

        actorResource.createNewBrand(
            brandName: brandName,
            data: data)
            log("brand created:")
    
    }
}