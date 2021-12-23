import MadbopContract from  0xe9c0c532df97e099
import NFTContract from  0xc3efbc9926eb00eb
import NonFungibleToken from 0x631e88ae7f1d7c20
transaction(){
    prepare(acct: AuthAccount) {
        let account = getAccount(0xe9c0c532df97e099)
        let adminRef = account
                .getCapability<&{MadbopContract.JukeboxPublic}>(MadbopContract.JukeboxPublicPath)
                .borrow()
                ?? panic("Could not borrow admin reference")
            
        let collectionRef =  acct.borrow<&NFTContract.Collection>(from: NFTContract.CollectionStoragePath)
        ??panic("could not borrow a reference to the the stored nft Collection")

        adminRef.openJukebox(jukeboxNFT : <- collectionRef.withdraw(withdrawID: 9 ), receiptAddress: 0xf3e107721f7302e7)  
    }


}