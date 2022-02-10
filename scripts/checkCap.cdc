import NFTContract from 0xd4221a1979538992
import NonFungibleToken from 0x631e88ae7f1d7c20

pub fun main():Bool{
    let account = getAccount(0xe9c0c532df97e099)
    let cap = account.getCapability(NFTContract.CollectionPublicPath)
            .borrow<&{NonFungibleToken.CollectionPublic}>()
            
    if cap == nil {
        return false
    }
    return true
}
