import MadbopContract from  0xe8aeee7a48e71d78
import MadbopNFTs from 0xe8aeee7a48e71d78
import NonFungibleToken from 0x1d7e57aa55817448
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