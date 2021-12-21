import NFTContract from  0xd4221a1979538992
import NonFungibleToken from 0x631e88ae7f1d7c20
transaction() {
    prepare(signer: AuthAccount) {
        let adminResouce <- NFTContract.createAdminResource()
        // save the resource to the signer's account storage
        signer.save(<- adminResouce, to: NFTContract.AdminResourceStoragePath)


        signer.link<&{NFTContract.UserSpecialCapability}>(
            /public/UserSpecialCapability,
            target: NFTContract.AdminResourceStoragePath
        )

        // link the UnlockedCapability in private storage
        signer.link<&{NFTContract.NFTMethodsCapability}>(
            /private/NFTMethodsCapability,
            target: NFTContract.AdminResourceStoragePath
        )

        let collection  <- NFTContract.createEmptyCollection()
        // store the empty NFT Collection in account storage
        signer.save( <- collection, to:NFTContract.CollectionStoragePath)
        log("Collection created for account".concat(signer.address.toString()))
        // create a public capability for the Collection
        signer.link<&{NonFungibleToken.CollectionPublic}>(NFTContract.CollectionPublicPath, target:NFTContract.CollectionStoragePath)
        log("Capability created")
      }
}