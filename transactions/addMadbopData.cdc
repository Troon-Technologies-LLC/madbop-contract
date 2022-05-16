
import MadbopContract from  0xe8aeee7a48e71d78

transaction(brandId:UInt64, jukeboxSchemaId:UInt64, nftSchemaId:UInt64){
    let adminRef: &MadbopContract.Jukebox
    prepare(acct: AuthAccount) {
        self.adminRef = acct.borrow<&MadbopContract.Jukebox>(from:MadbopContract.JukeboxStoragePath)
        ??panic("could not borrow admin reference")
    }
    execute{
        //self.adminRef.updateMadbopData(brandId: 1, jukeboxSchema: [2 as UInt64], nftSchema: [1 as UInt64])
        self.adminRef.updateMadbopData(brandId: brandId, jukeboxSchema: [jukeboxSchemaId], nftSchema: [nftSchemaId])
        log("madbop data updated")
    }


}