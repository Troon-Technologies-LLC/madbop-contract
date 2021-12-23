import NFTContract from "./../contracts/NFTContract.cdc"
import NonFungibleToken from "./../contracts/NonFungibleToken.cdc"
pub fun main(): NFTContract.Template {
    return NFTContract.getTemplateById(templateId:1)
}