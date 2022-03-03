import MadbopContract from  0x7108ffbc084287e4

transaction(templateId:UInt64){
    let adminRef: &MadbopContract.Jukebox
    prepare(acct: AuthAccount) {
        self.adminRef = acct.borrow<&MadbopContract.Jukebox>(from:MadbopContract.JukeboxStoragePath)
        ??panic("could not borrow admin reference")
    }
    execute{

        self.adminRef.createJukebox(templateId: 31, openDate: 1.0)

        log("jukebox created")

    }

}