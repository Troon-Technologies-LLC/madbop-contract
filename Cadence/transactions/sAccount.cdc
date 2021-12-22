import NFTContract from  0xc3efbc9926eb00eb
import NonFungibleToken from 0x631e88ae7f1d7c20
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
