import NFTContract from  0x01cf0e2f2f715450
import NonFungibleToken from 0x179b6b1cb6755e31
transaction {
    prepare(acct: AuthAccount) {

        let collection  <- NFTContract.createEmptyCollection()
        // store the empty NFT Collection in account storage
        acct.save( <- collection, to:NFTContract.CollectionStoragePath)
        log("Collection created for account".concat(acct.address.toString()))
        // create a public capability for the Collection
        acct.link<&{NonFungibleToken.CollectionPublic}>(NFTContract.CollectionPublicPath, target:NFTContract.CollectionStoragePath)
        log("Capability created")

    }
}
