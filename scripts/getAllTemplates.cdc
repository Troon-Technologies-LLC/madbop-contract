import MadbopNFTs from 0xe8aeee7a48e71d78
import NonFungibleToken from 0x1d7e57aa55817448
pub fun main():{UInt64: MadbopNFTs.Template} {
    return MadbopNFTs.getAllTemplates()
}