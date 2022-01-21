import NFTContractV01 from "./../contracts/NFTContractV01.cdc"
import NonFungibleToken from "./../contracts/NonFungibleToken.cdc"
transaction(templateId:UInt64, address:Address) {

    prepare(acct: AuthAccount) {
        let actorResource = acct.getCapability
        <&{NFTContractV01.NFTMethodsCapability}>
        (NFTContractV01.NFTMethodsCapabilityPrivatePath)
        .borrow() ?? 
        panic("could not borrow a reference to the NFTMethodsCapability interface")

    actorResource.mintNFT(templateId: templateId, account: address)

    }
}