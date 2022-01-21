import NFTContractV01 from "./../contracts/NFTContractV01.cdc"
transaction (){
  
    prepare(acct: AuthAccount) {
        let actorResource = acct.getCapability
            <&{NFTContractV01.NFTMethodsCapability}>
            (/private/NFTMethodsCapability)
            .borrow() ?? 
            panic("could not borrow a reference to the NFTMethodsCapability interface")

    }
}