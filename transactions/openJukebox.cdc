import MadbopContract from  0xb5660858a796e6ba
import MadbopNFTs from 0xa8185ff2f21792f2
import NonFungibleToken from 0x631e88ae7f1d7c20
transaction(adminAddress:Address, withdrawID:UInt64, receiptAddress:Address){
    prepare(acct: AuthAccount) {
        let account = getAccount(0xf3fcd2c1a78f5eee)
        let adminRef = account
                .getCapability<&{MadbopContract.JukeboxPublic}>(MadbopContract.JukeboxPublicPath)
                .borrow()
                ?? panic("Could not borrow admin reference")
            
        let collectionRef =  acct.borrow<&MadbopNFTs.Collection>(from: MadbopNFTs.CollectionStoragePath)
        ??panic("could not borrow a reference to the the stored nft Collection")

        adminRef.openJukebox(jukeboxNFT : <- collectionRef.withdraw(withdrawID: 1), receiptAddress: 0xe03daebed8ca0615)  
    }


}