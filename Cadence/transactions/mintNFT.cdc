import NFTContract from "./../contracts/NFTContract.cdc"
import NonFungibleToken from "./../contracts/NonFungibleToken.cdc"
transaction(templateId:UInt64, address:Address) {

    prepare(acct: AuthAccount) {
        let actorResource = acct.getCapability
        <&{NFTContract.NFTMethodsCapability}>
        (/private/NFTMethodsCapability)
        .borrow() ?? 
        panic("could not borrow a reference to the NFTMethodsCapability interface")

    actorResource.mintNFT(templateId: templateId, account: address)

    }
}