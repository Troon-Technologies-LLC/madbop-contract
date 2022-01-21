import MadbopContract from  "./../contracts/MadbopContract.cdc"
pub fun main(): MadbopContract.MadbopData  {
    return MadbopContract.getMadbopData()
    
}