import NFTContract from 0xc3efbc9926eb00eb
pub fun main():{UInt64: NFTContract.Template} {
    return NFTContract.getAllTemplates()
}