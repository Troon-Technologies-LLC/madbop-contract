import NFTContract from "./../contracts/NFTContract.cdc"
import NonFungibleToken from "./../contracts/NonFungibleToken.cdc"

pub fun main():Bool{
    let account = getAccount(0x77322c05a4b12b74)
    let cap = account.getCapability(NFTContract.CollectionPublicPath)
            .borrow<&{NonFungibleToken.CollectionPublic}>()
            
    if cap == nil {
     return false
    }
    return true
}
