import MadbopNFTs from  0xa8185ff2f21792f2
import NonFungibleToken from 0x631e88ae7f1d7c20

pub fun main(account:Address):Bool{
    let account = getAccount(account)
    let cap = account.getCapability(MadbopNFTs.CollectionPublicPath)
            .borrow<&{MadbopNFTs.MadbopNFTsCollectionPublic}>()
    if cap == nil {
        return false
    }
    return true
}