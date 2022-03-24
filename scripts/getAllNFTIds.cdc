import MadbopNFTs from 0xa8185ff2f21792f2
import NonFungibleToken from 0x631e88ae7f1d7c20

pub fun main() : [UInt64]{
    let account1 = getAccount(0xf3e107721f7302e7)
    let acct1Capability =  account1.getCapability(MadbopNFTs.CollectionPublicPath)
                            .borrow<&{MadbopNFTs.MadbopNFTsCollectionPublic}>()
                            ??panic("could not borrow receiver reference ")




    return acct1Capability.getIDs()
}
