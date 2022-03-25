import MadbopNFTs from 0xa8185ff2f21792f2
import NonFungibleToken from 0x1d7e57aa55817448
//        brandName: "Madbop ",
//        author: 0xf3fcd2c1a78f5eee,
//        data: {
//            "name":"Madbop ",
//            "description":"WE BUILD DIGITAL SOLUTIONS THAT ADVANCE,IGNITE,AND EVOLVE YOUR BUSINESS",
//            "url":"https://madbop.com/"   }

transaction (brandName:String, data:{String:String}){
    prepare(acct: AuthAccount) {
        let actorResource = acct.getCapability
            <&{MadbopNFTs.NFTMethodsCapability}>
            (MadbopNFTs.NFTMethodsCapabilityPrivatePath)
            .borrow() ?? 
            panic("could not borrow a reference to the NFTMethodsCapability interface")

        actorResource.createNewBrand(
            brandName: brandName,
            data: data)
            log("brand created:")
    
    }
}