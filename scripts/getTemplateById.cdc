import MadbopNFTs from 0xa8185ff2f21792f2
import NonFungibleToken from 0x1d7e57aa55817448
pub fun main(): MadbopNFTs.Template {
    return MadbopNFTs.getTemplateById(templateId:1)
}