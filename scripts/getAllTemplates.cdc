import MadbopNFTs from 0xa8185ff2f21792f2
import NonFungibleToken from 0x1d7e57aa55817448
pub fun main():{UInt64: MadbopNFTs.Template} {
    return MadbopNFTs.getAllTemplates()
}