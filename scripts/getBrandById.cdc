import NFTContractV01 from "./../contracts/NFTContractV01.cdc"
import NonFungibleToken from "./../contracts/NonFungibleToken.cdc"
pub fun main(): {UInt64:NFTContractV01.Brand} {
    return NFTContractV01.getAllBrands()

}