import NFTContract from 0xc3efbc9926eb00eb
import NonFungibleToken from 0x631e88ae7f1d7c20

pub fun main() : {UInt64: AnyStruct}{
    let account1 = getAccount(0x9ddbd00b5f35899c)
    let acct1Capability =  account1.getCapability(NFTContract.CollectionPublicPath)
                            .borrow<&{NonFungibleToken.CollectionPublic}>()
                            ??panic("could not borrow receiver reference ")




    var nftIds =   acct1Capability.getIDs()

    var dict : {UInt64: AnyStruct} = {}

    


    for nftId in nftIds {
        var nftData = NFTContract.getNFTDataById(nftId: nftId)
        var templateDataById =  NFTContract.getTemplateById(templateId: nftData.templateID)

        var nftMetaData : {String:AnyStruct} = {}

        nftMetaData["mintNumber"] =nftData.mintNumber;
        nftMetaData["templateData"] = templateDataById;


        dict.insert(key: nftId,nftMetaData)
    }
    return dict


}