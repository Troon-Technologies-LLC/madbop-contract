import MadbopContract from  0xe9c0c532df97e099

pub fun main(): MadbopContract.JukeboxData {

    return MadbopContract.getJukeboxById(jukeboxId:3)
    
}