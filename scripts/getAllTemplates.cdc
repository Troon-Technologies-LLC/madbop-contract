import MadbopNFTs from 0xa8185ff2f21792f2
import NonFungibleToken from 0x631e88ae7f1d7c20
pub fun main():{UInt64: MadbopNFTs.Template} {
    return MadbopNFTs.getAllTemplates()
}