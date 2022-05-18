
import MadbopNFTs from 0xe8aeee7a48e71d78
import NonFungibleToken from 0x1d7e57aa55817448

pub fun main() : [UInt64]{
    let account1 = getAccount(0x01cf0e2f2f715450)
    let acct1Capability =  account1.getCapability(MadbopNFTs.CollectionPublicPath)
                            .borrow<&{MadbopNFTs.MadbopNFTsCollectionPublic}>()
                            ??panic("could not borrow receiver reference ")




    return acct1Capability.getIDs()
}
