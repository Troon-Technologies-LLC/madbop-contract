import MadbopContract from  "./../contracts/MadbopContract.cdc"

transaction(templateId:UInt64){
    let adminRef: &MadbopContract.Jukebox
    prepare(acct: AuthAccount) {
        self.adminRef = acct.borrow<&MadbopContract.Jukebox>(from:MadbopContract.JukeboxStoragePath)
        ??panic("could not borrow admin reference")
    }
    execute{
        //templateId: 2, openDate: 1640351132.0
        self.adminRef.createJukebox(templateId: templateId,openDate: openDate);

        log("jukebox created")

    }

}