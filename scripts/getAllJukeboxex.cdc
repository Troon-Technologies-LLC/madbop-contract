import MadbopContract from 0xe8aeee7a48e71d78

pub fun main(): MadbopContract.JukeboxData {

    return MadbopContract.getJukeboxById(jukeboxId:8)
    
}