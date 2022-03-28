import MadbopNFTs from 0x179b6b1cb6755e31
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
