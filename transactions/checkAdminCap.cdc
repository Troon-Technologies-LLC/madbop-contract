import MadbopNFTs from "./../contracts/MadbopNFTs.cdc"
transaction (){
    prepare(acct: AuthAccount) {
        let actorResource = acct.getCapability
            <&{MadbopNFTs.NFTMethodsCapability}>
            (/private/NFTMethodsCapability)
            .borrow() ?? 
            panic("could not borrow a reference to the NFTMethodsCapability interface")

    }
}
 