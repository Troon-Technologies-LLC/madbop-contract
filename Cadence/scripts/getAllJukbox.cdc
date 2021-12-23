import MadbopContract from  "./../contracts/MadbopContract.cdc"
pub fun main(): {UInt64:MadbopContract.JukeboxData}  {
    return MadbopContract.getAllJukeboxes()
    
}