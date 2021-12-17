import NFTContract from 0x01cf0e2f2f715450
import NonFungibleToken from 0x179b6b1cb6755e31

pub fun main():Bool{
    let account = getAccount(0xf3fcd2c1a78f5eee)
    let cap = account.getCapability(NFTContract.CollectionPublicPath)
            .borrow<&{NonFungibleToken.CollectionPublic}>()
            
    if cap == nil {
     return false
    }
    return true
}
