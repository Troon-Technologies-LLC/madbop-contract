
import MadbopNFTs from 0xe8aeee7a48e71d78
import NonFungibleToken from 0x1d7e57aa55817448
transaction {
    prepare(acct: AuthAccount) {

        let collection  <- MadbopNFTs.createEmptyCollection()
        // store the empty NFT Collection in account storage
        acct.save( <- collection, to:MadbopNFTs.CollectionStoragePath)
        log("Collection created for account".concat(acct.address.toString()))
        // create a public capability for the Collection
        acct.link<&{MadbopNFTs.MadbopNFTsCollectionPublic}>(MadbopNFTs.CollectionPublicPath, target:MadbopNFTs.CollectionStoragePath)
        log("Capability created")

    }
}
