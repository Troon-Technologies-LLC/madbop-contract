import NFTContract from "./../contracts/NFTContract.cdc"
import NonFungibleToken from "./../contracts/NonFungibleToken.cdc"
transaction (){
  
    prepare(acct: AuthAccount) {
        let actorResource = acct.getCapability
            <&{NFTContract.NFTMethodsCapability}>
            (/private/NFTMethodsCapability)
            .borrow() ?? 
            panic("could not borrow a reference to the NFTMethodsCapability interface")

        actorResource.createNewBrand(
        brandName: "Madbop 2",
        author: 0x7108ffbc084287e4,
        data: {
            "name":"Madbop 2",
            "description":"WE BUILD DIGITAL SOLUTIONS THAT ADVANCE,IGNITE,AND EVOLVE YOUR BUSINESS",
            "url":"https://madbop.com/"
        })
    
    }
}