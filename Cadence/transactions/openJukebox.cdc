import MadbopContract from  0x7108ffbc084287e4
import NFTContract from  0xc3efbc9926eb00eb
import NonFungibleToken from 0x631e88ae7f1d7c20
transaction(){
    prepare(acct: AuthAccount) {
        let account = getAccount(0x7108ffbc084287e4)
        let adminRef = account
                .getCapability<&{MadbopContract.JukeboxPublic}>(MadbopContract.JukeboxPublicPath)
                .borrow()
                ?? panic("Could not borrow admin reference")
            
        let collectionRef =  acct.borrow<&NFTContract.Collection>(from: NFTContract.CollectionStoragePath)
        ??panic("could not borrow a reference to the the stored nft Collection")

        adminRef.openJukebox(jukeboxNFT : <- collectionRef.withdraw(withdrawID: 16), receiptAddress: 0x77322c05a4b12b74)  
    }


}