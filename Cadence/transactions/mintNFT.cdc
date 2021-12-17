import NFTContract from  0x01cf0e2f2f715450
transaction() {

    prepare(acct: AuthAccount) {
        let actorResource = acct.getCapability
        <&{NFTContract.NFTMethodsCapability}>
        (/private/NFTMethodsCapability)
        .borrow() ?? 
        panic("could not borrow a reference to the NFTMethodsCapability interface")

    actorResource.mintNFT(templateId: 2, account: 0xe03daebed8ca0615)

    }
}