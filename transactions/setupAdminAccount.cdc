import MadbopNFTs from 0x179b6b1cb6755e31
transaction() {
    prepare(signer: AuthAccount) {
        // save the resource to the signer's account storage
        if signer.getLinkTarget(MadbopNFTs.NFTMethodsCapabilityPrivatePath) == nil {
            let adminResouce <- MadbopNFTs.createAdminResource()
            signer.save(<- adminResouce, to: MadbopNFTs.AdminResourceStoragePath)
            // link the UnlockedCapability in private storage
            signer.link<&{MadbopNFTs.NFTMethodsCapability}>(
                MadbopNFTs.NFTMethodsCapabilityPrivatePath,
                target: MadbopNFTs.AdminResourceStoragePath
            )
        }

        signer.link<&{MadbopNFTs.UserSpecialCapability}>(
            /public/UserSpecialCapability,
            target: MadbopNFTs.AdminResourceStoragePath
        )

        let collection  <- MadbopNFTs.createEmptyCollection()
        // store the empty NFT Collection in account storage
        signer.save( <- collection, to:MadbopNFTs.CollectionStoragePath)
        log("Collection created for account".concat(signer.address.toString()))
        // create a public capability for the Collection
        signer.link<&{MadbopNFTs.MadbopNFTsCollectionPublic}>(MadbopNFTs.CollectionPublicPath, target:MadbopNFTs.CollectionStoragePath)
        log("Capability created")
    }
}
