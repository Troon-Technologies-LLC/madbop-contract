import MadbopNFTs from 0xa8185ff2f21792f2
import NonFungibleToken from 0x1d7e57aa55817448
transaction(templateId:UInt64, address:Address) {

    prepare(acct: AuthAccount) {
        let actorResource = acct.getCapability
        <&{MadbopNFTs.NFTMethodsCapability}>
        (MadbopNFTs.NFTMethodsCapabilityPrivatePath)
        .borrow() ?? 
        panic("could not borrow a reference to the NFTMethodsCapability interface")

    actorResource.mintNFT(templateId: templateId, account: address)

    }
}