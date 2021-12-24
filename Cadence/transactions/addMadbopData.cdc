<<<<<<< HEAD
import MadbopContract from  "./../contracts/MadbopContract.cdc"
=======
import MadbopContract from  0x7108ffbc084287e4
>>>>>>> dev
transaction(){
    let adminRef: &MadbopContract.Jukebox
    prepare(acct: AuthAccount) {
        self.adminRef = acct.borrow<&MadbopContract.Jukebox>(from:MadbopContract.JukeboxStoragePath)
        ??panic("could not borrow admin reference")
    }
    execute{
        self.adminRef.updateMadbopData(brandId: 5, jukeboxSchema: [7 as UInt64], nftSchema: [6 as UInt64])
        log("madbop data updated")

    }


}