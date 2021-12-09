import NFTContract from 0xc3efbc9926eb00eb
transaction (){
  
    prepare(acct: AuthAccount) {
        let actorResource = acct.getCapability
            <&{NFTContract.NFTMethodsCapability}>
            (/private/NFTMethodsCapability)
            .borrow() ?? 
            panic("could not borrow a reference to the NFTMethodsCapability interface")

        actorResource.createNewBrand(
        brandName: "Troon",
        author: 0xc3efbc9926eb00eb,
        data: {
            "name":"Troon",
            "description":"WE BUILD DIGITAL SOLUTIONS THAT ADVANCE,IGNITE,AND EVOLVE YOUR BUSINESS",
            "url":"https://troontechnologies.com/"
        })
    
    }
}