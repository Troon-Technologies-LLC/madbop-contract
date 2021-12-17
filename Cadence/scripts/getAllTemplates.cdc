import NFTContract from 0x01cf0e2f2f715450
pub fun main():{UInt64: NFTContract.Template} {
    return NFTContract.getAllTemplates()
}