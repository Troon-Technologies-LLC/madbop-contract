import NFTContract from  0xd4221a1979538992

pub fun main():Bool{
    let account = getAccount(0xa888f479b6525db2)
    let cap = account.getCapability(NFTContract.CollectionPublicPath)
            .borrow<&{NonFungibleToken.CollectionPublic}>()
            
    if cap == nil {
     return false
    }
    return true
}
