import NFTContract from 0xc3efbc9926eb00eb
transaction(templateId:UInt64, receiptAccount:Address) {

    prepare(acct: AuthAccount) {
        let actorResource = acct.getCapability
        <&{NFTContract.NFTMethodsCapability}>
        (/private/NFTMethodsCapability)
        .borrow() ?? 
        panic("could not borrow a reference to the NFTMethodsCapability interface")

    actorResource.mintNFT(templateId: templateId, account: receiptAccount)

    }
}