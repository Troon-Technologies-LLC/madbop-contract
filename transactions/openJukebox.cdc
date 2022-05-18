
import MadbopContract from  0xe8aeee7a48e71d78
import MadbopNFTs from 0xe8aeee7a48e71d78
import NonFungibleToken from 0x1d7e57aa55817448
transaction(){
    prepare(acct: AuthAccount) {
        let account = getAccount(0x179b6b1cb6755e31)
        let adminRef = account
                .getCapability<&{MadbopContract.JukeboxPublic}>(MadbopContract.JukeboxPublicPath)
                .borrow()
                ?? panic("Could not borrow admin reference")
            
        let collectionRef =  acct.borrow<&MadbopNFTs.Collection>(from: MadbopNFTs.CollectionStoragePath)
        ??panic("could not borrow a reference to the the stored nft Collection")

        adminRef.openJukebox(jukeboxNFT : <- collectionRef.withdraw(withdrawID: 3), receiptAddress: 0x01cf0e2f2f715450)  
    }


}