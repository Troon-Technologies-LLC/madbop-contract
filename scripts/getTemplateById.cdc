import NFTContractV01 from "./../contracts/NFTContractV01.cdc"
import NonFungibleToken from "./../contracts/NonFungibleToken.cdc"
pub fun main(): NFTContractV01.Template {
    return NFTContractV01.getTemplateById(templateId:1)
}