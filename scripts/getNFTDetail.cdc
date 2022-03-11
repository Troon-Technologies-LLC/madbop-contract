import MadbopNFTs from 0xa8185ff2f21792f2
import NonFungibleToken from 0x631e88ae7f1d7c20
pub fun main() : {UInt64: AnyStruct}{
    let account1 = getAccount(0xf3e107721f7302e7)
    let acct1Capability =  account1.getCapability(MadbopNFTs.CollectionPublicPath)
                           .borrow<&{MadbopNFTs.MadbopNFTsCollectionPublic}>()
                            ??panic("could not borrow receiver reference ")
    var nftIds =   acct1Capability.getIDs()

    var dict : {UInt64: AnyStruct} = {}

    for nftId in nftIds {
        var MadbopNFTData = MadbopNFTs.getMadbopNFTDataById(nftId: nftId)
        var templateDataById =  MadbopNFTs.getTemplateById(templateId: MadbopNFTData.templateID)

        var nftMetaData : {String:AnyStruct} = {}

        nftMetaData["templateId"] =MadbopNFTData.templateID;
        nftMetaData["mintNumber"] =MadbopNFTData.mintNumber;
        nftMetaData["templateData"] = templateDataById;

        dict.insert(key: nftId,nftMetaData)
    }
        
    return dict


}