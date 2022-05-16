import MadbopNFTs from  0xe8aeee7a48e71d78
import NonFungibleToken from 0x1d7e57aa55817448

pub fun main(account:Address):Bool{
    let account = getAccount(account)
    let cap = account.getCapability(MadbopNFTs.CollectionPublicPath)
            .borrow<&{MadbopNFTs.MadbopNFTsCollectionPublic}>()
    if cap == nil {
        return false
    }
    return true
}