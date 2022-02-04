import NFTContract from 0xc3efbc9926eb00eb
import NonFungibleToken from 0x631e88ae7f1d7c20

pub fun main():Bool{
    let account = getAccount(0x6bec801eca93f9cb)
    let cap = account.getCapability(NFTContract.CollectionPublicPath)
            .borrow<&{NonFungibleToken.CollectionPublic}>()
            
    if cap == nil {
     return false
    }
    return true
}