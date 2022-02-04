import NFTContract from "./../contracts/NFTContract.cdc"
import NonFungibleToken from "./../contracts/NonFungibleToken.cdc"
pub fun main() : {UInt64: AnyStruct}{
    let account1 = getAccount(0xf3e107721f7302e7)
    let acct1Capability =  account1.getCapability(NFTContract.CollectionPublicPath)
                           .borrow<&{NonFungibleToken.CollectionPublic}>()
                            ??panic("could not borrow receiver reference ")




    var nftIds =   acct1Capability.getIDs()

    var dict : {UInt64: AnyStruct} = {}

    


    for nftId in nftIds {
        var nftData = NFTContract.getNFTDataById(nftId: nftId)
        var templateDataById =  NFTContract.getTemplateById(templateId: nftData.templateID)

        var nftMetaData : {String:AnyStruct} = {}

        nftMetaData["templateId"] =nftData.templateID;
        nftMetaData["mintNumber"] =nftData.mintNumber;
        nftMetaData["templateData"] = templateDataById;


        dict.insert(key: nftId,nftMetaData)
        
        

       
    }
        
    return dict


}