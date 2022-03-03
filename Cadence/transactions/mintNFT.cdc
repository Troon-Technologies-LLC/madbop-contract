import NFTContract from  0xc3efbc9926eb00eb
import NonFungibleToken from 0x631e88ae7f1d7c20
transaction() {

    prepare(acct: AuthAccount) {
        let actorResource = acct.getCapability
        <&{NFTContract.NFTMethodsCapability}>
        (/private/NFTMethodsCapability)
        .borrow() ?? 
        panic("could not borrow a reference to the NFTMethodsCapability interface")

<<<<<<< HEAD
    actorResource.mintNFT(templateId: 2, account: 0xa888f479b6525db2)
=======
    actorResource.mintNFT(templateId: 31, account: 0x77322c05a4b12b74)
>>>>>>> dev

    }
}