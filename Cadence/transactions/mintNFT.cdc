import NFTContract from  0xc3efbc9926eb00eb
import NonFungibleToken from 0x631e88ae7f1d7c20
transaction() {

    prepare(acct: AuthAccount) {
        let actorResource = acct.getCapability
        <&{NFTContract.NFTMethodsCapability}>
        (/private/NFTMethodsCapability)
        .borrow() ?? 
        panic("could not borrow a reference to the NFTMethodsCapability interface")

    actorResource.mintNFT(templateId: 15, account: 0xe9c0c532df97e099)

    }
}