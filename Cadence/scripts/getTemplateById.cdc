import NFTContract from  0xc3efbc9926eb00eb
pub fun main(): NFTContract.Template {
    return NFTContract.getTemplateById(templateId:2)
}