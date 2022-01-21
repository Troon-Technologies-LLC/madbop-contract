import MadbopContract from  "./../contracts/MadbopContract.cdc"
import NFTContractV01 from "./../contracts/NFTContractV01.cdc"
import NonFungibleToken from "./../contracts/NonFungibleToken.cdc"
transaction(adminAddress:Address, withdrawID:UInt64, receiptAddress:Address){
    prepare(acct: AuthAccount) {
        let account = getAccount(0xf3fcd2c1a78f5eee)
        let adminRef = account
                .getCapability<&{MadbopContract.JukeboxPublic}>(MadbopContract.JukeboxPublicPath)
                .borrow()
                ?? panic("Could not borrow admin reference")
            
        let collectionRef =  acct.borrow<&NFTContractV01.Collection>(from: NFTContractV01.CollectionStoragePath)
        ??panic("could not borrow a reference to the the stored nft Collection")

        adminRef.openJukebox(jukeboxNFT : <- collectionRef.withdraw(withdrawID: 1), receiptAddress: 0xe03daebed8ca0615)  
    }


}