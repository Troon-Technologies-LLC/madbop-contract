import MadbopContract from 0xb5660858a796e6ba

pub fun main(): MadbopContract.JukeboxData {

    return MadbopContract.getJukeboxById(jukeboxId:8)
    
}