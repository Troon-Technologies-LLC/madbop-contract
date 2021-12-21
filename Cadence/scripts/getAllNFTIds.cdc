import NFTContract from 0x01cf0e2f2f715450

pub fun main() : [UInt64]{
    let account1 = getAccount(0xe03daebed8ca0615)
    let acct1Capability =  account1.getCapability(NFTContract.CollectionPublicPath)
                            .borrow<&{NonFungibleToken.CollectionPublic}>()
                            ??panic("could not borrow receiver reference ")




    return acct1Capability.getIDs()
}
