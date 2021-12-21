import MadbopContract from  0xa888f479b6525db2
import NFTContract from  0xd4221a1979538992
import NonFungibleToken from 0x631e88ae7f1d7c20
transaction(){
    prepare(acct: AuthAccount) {
        let account = getAccount(0xa888f479b6525db2)
        let adminRef = account
                .getCapability<&{MadbopContract.JukeboxPublic}>(MadbopContract.JukeboxPublicPath)
                .borrow()
                ?? panic("Could not borrow admin reference")
            
        let collectionRef =  acct.borrow<&NFTContract.Collection>(from: NFTContract.CollectionStoragePath)
        ??panic("could not borrow a reference to the the stored nft Collection")

        adminRef.openJukebox(jukeboxNFT : <- collectionRef.withdraw(withdrawID: 1), receiptAddress: 0xa888f479b6525db2)  
    }


}