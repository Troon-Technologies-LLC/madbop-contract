import MadbopNFTs from 0xe8aeee7a48e71d78
import NonFungibleToken from 0x1d7e57aa55817448
pub fun main() : {UInt64: AnyStruct}{
    let account1 = getAccount(0xf3e107721f7302e7)
    let acct1Capability =  account1.getCapability(MadbopNFTs.CollectionPublicPath)
                           .borrow<&{NonFungibleToken.CollectionPublic}>()
                            ??panic("could not borrow receiver reference ")




    var nftIds =   acct1Capability.getIDs()

    var dict : {UInt64: AnyStruct} = {}

    


    for nftId in nftIds {
        var nftData = MadbopNFTs.getNFTDataById(nftId: nftId)
        var templateDataById =  MadbopNFTs.getTemplateById(templateId: nftData.templateID)

        var nftMetaData : {String:AnyStruct} = {}

        nftMetaData["templateId"] =nftData.templateID;
        nftMetaData["mintNumber"] =nftData.mintNumber;
        nftMetaData["templateData"] = templateDataById;


        dict.insert(key: nftId,nftMetaData)
        
        

       
    }
        
    return dict


}