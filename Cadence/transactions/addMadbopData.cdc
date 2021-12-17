import MadbopContract from  0xf3fcd2c1a78f5eee
transaction(){
    let adminRef: &MadbopContract.Jukebox
    prepare(acct: AuthAccount) {
        self.adminRef = acct.borrow<&MadbopContract.Jukebox>(from:MadbopContract.JukeboxStoragePath)
        ??panic("could not borrow admin reference")
    }
    execute{
        self.adminRef.updateMadbopData(brandId: 1, jukeboxSchema: [2 as UInt64], nftSchema: [1 as UInt64])
        log("madbop data updated")

    }


}