import MadbopContract from  "./../contracts/MadbopContract.cdc"

transaction(){
    let adminRef: &MadbopContract.Jukebox
    prepare(acct: AuthAccount) {
        self.adminRef = acct.borrow<&MadbopContract.Jukebox>(from:MadbopContract.JukeboxStoragePath)
        ??panic("could not borrow admin reference")
    }



    execute{

        self.adminRef.createJukebox(templateId: 2, openDate: 1.0)

        log("jukebox created")

    }


}