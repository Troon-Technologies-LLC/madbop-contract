import NFTContract from  0xc3efbc9926eb00eb
import NonFungibleToken from 0x631e88ae7f1d7c20
pub fun main():{UInt64: NFTContract.Template} {
    return NFTContract.getAllTemplates()
}