import MadbopContract from  0xa888f479b6525db2

transaction(templateId:UInt64){
    let adminRef: &MadbopContract.Jukebox
    prepare(acct: AuthAccount) {
        self.adminRef = acct.borrow<&MadbopContract.Jukebox>(from:MadbopContract.JukeboxStoragePath)
        ??panic("could not borrow admin reference")
    }
    execute{
        self.adminRef.createJukebox(templateId: templateId, openDate: 1.0)
    }

}