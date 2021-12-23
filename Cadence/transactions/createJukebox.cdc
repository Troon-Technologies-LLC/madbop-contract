import MadbopContract from  0xe9c0c532df97e099

transaction(){
    let adminRef: &MadbopContract.Jukebox
    prepare(acct: AuthAccount) {
        self.adminRef = acct.borrow<&MadbopContract.Jukebox>(from:MadbopContract.JukeboxStoragePath)
        ??panic("could not borrow admin reference")
    }



    execute{

        self.adminRef.createJukebox(templateId: 15, openDate: 1.0)

        log("jukebox created")

    }


}