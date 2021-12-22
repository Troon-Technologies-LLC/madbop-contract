import NFTContract from  0xc3efbc9926eb00eb
import NonFungibleToken from 0x631e88ae7f1d7c20
transaction (){
  
    prepare(acct: AuthAccount) {
        let actorResource = acct.getCapability
            <&{NFTContract.NFTMethodsCapability}>
            (/private/NFTMethodsCapability)
            .borrow() ?? 
            panic("could not borrow a reference to the NFTMethodsCapability interface")

        actorResource.createNewBrand(
        brandName: "Madbop",
        author: 0xf3fcd2c1a78f5eee,
        data: {
            "name":"Madbop",
            "description":"WE BUILD DIGITAL SOLUTIONS THAT ADVANCE,IGNITE,AND EVOLVE YOUR BUSINESS",
            "url":"https://madbop.com/"
        })
    
    }
}