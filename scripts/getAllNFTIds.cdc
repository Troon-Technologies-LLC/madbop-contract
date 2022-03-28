import MadbopNFTs from 0x179b6b1cb6755e31

pub fun main() : [UInt64]{
    let account1 = getAccount(0x01cf0e2f2f715450)
    let acct1Capability =  account1.getCapability(MadbopNFTs.CollectionPublicPath)
                            .borrow<&{MadbopNFTs.MadbopNFTsCollectionPublic}>()
                            ??panic("could not borrow receiver reference ")




    return acct1Capability.getIDs()
}
