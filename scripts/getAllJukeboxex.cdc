import MadbopContract from  "./../contracts/MadbopContract.cdc"

pub fun main(): MadbopContract.JukeboxData {

    return MadbopContract.getJukeboxById(jukeboxId:8)
    
}