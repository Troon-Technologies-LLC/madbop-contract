import MadbopContract from  0x179b6b1cb6755e31

transaction(templateId:UInt64,openDate:UFix64){
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