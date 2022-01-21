import NFTContractV01 from 0xc3efbc9926eb00eb
import NonFungibleToken from 0x631e88ae7f1d7c20

pub fun main() : [UInt64]{
    let account1 = getAccount(0xf3e107721f7302e7)
    let acct1Capability =  account1.getCapability(NFTContractV01.CollectionPublicPath)
                            .borrow<&{NonFungibleToken.CollectionPublic}>()
                            ??panic("could not borrow receiver reference ")




    return acct1Capability.getIDs()
}
