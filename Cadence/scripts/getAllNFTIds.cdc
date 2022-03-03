import NFTContract from  0xc3efbc9926eb00eb
import NonFungibleToken from 0x631e88ae7f1d7c20

pub fun main() : [UInt64]{
    let account1 = getAccount(0xe03daebed8ca0615)
    let acct1Capability =  account1.getCapability(NFTContract.CollectionPublicPath)
                            .borrow<&{NonFungibleToken.CollectionPublic}>()
                            ??panic("could not borrow receiver reference ")




    return acct1Capability.getIDs()
}
