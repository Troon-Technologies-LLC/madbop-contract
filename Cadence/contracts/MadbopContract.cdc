import NFTContract from "./NFTContract.cdc"
import NonFungibleToken from "./NonFungibleToken.cdc"
pub contract MadbopContract {


    pub event MadbopDataInitialized(brandId:UInt64,jukeboxSchema:[UInt64], nftSchema :[UInt64])
    pub event MadbopDataUpdated(brandId:UInt64,jukeboxSchema:[UInt64], nftSchema :[UInt64])
    pub event JukeboxCreated(templateId:UInt64, openDate:UFix64)
    pub event JukeboxOpened(nftId:UInt64,receiptAddress:Address?)


    pub let JukeboxStoragePath : StoragePath
    pub let JukeboxPublicPath : PublicPath

    access(self) var allJukeboxes :{UInt64:JukeboxData}
    access(self) var madbopData   : MadbopData

    access(contract) let adminRef : Capability<&{NFTContract.NFTMethodsCapability}>


   //All methods called or accessed by only the admin
    pub struct MadbopData {
        pub var brandId:UInt64
        access(contract) var jukeboxSchema:[UInt64]
        access(contract) var  nftSchema :[UInt64]

        init(brandId:UInt64,jukeboxSchema:[UInt64], nftSchema :[UInt64]){
            self.brandId = brandId
            self.jukeboxSchema = jukeboxSchema
            self.nftSchema =nftSchema
        }
        pub fun updateData(brandId:UInt64,jukeboxSchema:[UInt64], nftSchema:[UInt64]){
            self.brandId = brandId
            self.jukeboxSchema = jukeboxSchema
            self.nftSchema = nftSchema
        }
    }

    pub struct  JukeboxData {
        pub let templateId: UInt64
        pub let openDate: UFix64

        init(templateId:UInt64,openDate:UFix64){
            self.templateId = templateId
            self.openDate = openDate
        }

    }

    pub resource interface JukeboxPublic{
    pub fun openJukebox(jukeboxNFT:@NonFungibleToken.NFT, receiptAddress:Address)
    }

    pub resource Jukebox:JukeboxPublic {

        pub fun createJukebox(templateId:UInt64, openDate:UFix64){
            pre {
                templateId !=nil: "template id must not be null"
                MadbopContract.allJukeboxes[templateId] ==nil: "Jukebox already created with this template id"
                openDate > 0.0 : "Open date should be greater than zero"
            }    
            let templateData = NFTContract.getTemplateById(templateId: templateId)

            assert(templateData != nil, message: "specific template id does not exist")

            //Brand Id of template must be Madbop            
            assert(templateData.brandId == MadbopContract.madbopData.brandId, message: "Invalid Brand id")

            //Template must be the Jukebox
            assert(MadbopContract.madbopData.jukeboxSchema.contains(templateData.schemaId), message: "Template is not a Jukebox")

            //Check all templates under the jukexbox are created or not
            var allNftTemplateExists =  true;
            let allIds  = templateData.immutableData["nftTemplates"]! as! [AnyStruct]
            for tempID in allIds {
                    let nftTemplateData = NFTContract.getTemplateById(templateId: UInt64(tempID as! Int) )
                    if(nftTemplateData == nil){
                        allNftTemplateExists = false
                        break
                    }             
            }
            assert(allNftTemplateExists, message: "Invalid NFTs")
        
            let newJukebox = JukeboxData(templateId:templateId,openDate:openDate)
            MadbopContract.allJukeboxes[templateId] = newJukebox

            //Call event            
            emit JukeboxCreated(templateId:templateId, openDate:openDate)
        }

        pub fun updateMadbopData(brandId:UInt64,jukeboxSchema:[UInt64],nftSchema:[UInt64]){
            pre {
                brandId!=nil:"brand id must not be null"
                jukeboxSchema !=nil:"jukebox schema array must not be null"
                nftSchema !=nil:"nft schema array must not be null"
            }

            MadbopContract.madbopData.updateData(brandId: brandId, jukeboxSchema: jukeboxSchema, nftSchema: nftSchema)
            //Call event
            emit MadbopDataUpdated(brandId:brandId,jukeboxSchema:jukeboxSchema, nftSchema :nftSchema)

        }

        pub fun openJukebox(jukeboxNFT:@NonFungibleToken.NFT, receiptAddress:Address){
            pre {
                jukeboxNFT !=nil : "jukebox nft must not be null"
                receiptAddress !=nil: "receipt address must not be null"
            }
            var jukeboxNFTdata = NFTContract.getNFTDataById(nftId: jukeboxNFT.id)            
            var jukeboxTemplateData =  NFTContract.getTemplateById(templateId: jukeboxNFTdata.templateID)

            //Check if it is regiesterd or not
            assert(MadbopContract.allJukeboxes[jukeboxNFTdata.templateID]!=nil, message: "Jukebox is not regiestered") 

            //Check if current date is greater or equal than opendate 

            //MadbopContract.allJukeboxes[jukeboxNFTdata.templateID]!.openDate >= getCurrentBlock().timestamp

            let allIds  = jukeboxTemplateData.immutableData["nftTemplates"]! as! [AnyStruct]
            for tempID in allIds {
                    MadbopContract.adminRef.borrow()!.mintNFT(templateId: UInt64(tempID as! Int), account: receiptAddress)
                }             
               //will add an if condition
            emit  JukeboxOpened(nftId:jukeboxNFT.id,receiptAddress:self.owner?.address)
            destroy jukeboxNFT
        }

    }
    pub fun getAllJukeboxes():{UInt64:JukeboxData}{
        pre {
            MadbopContract.allJukeboxes !=nil: "jukebox does not exist"
        }
        return MadbopContract.allJukeboxes
    }
    pub fun getJukeboxById(jukeboxId:UInt64):JukeboxData{
        pre {
            MadbopContract.allJukeboxes[jukeboxId]!=nil: "jukebox id does not exist"
        }
        return MadbopContract.allJukeboxes[jukeboxId]!
    }
    pub fun getMadbopData():MadbopData{
        return MadbopContract.madbopData
    }


    init(){
        self.allJukeboxes = {}
        self.madbopData = MadbopData(brandId:1, jukeboxSchema:[], nftSchema:[])
        emit MadbopDataInitialized(brandId:1,jukeboxSchema:[], nftSchema :[])
        
        var adminPrivateCap =  self.account.getCapability
            <&{NFTContract.NFTMethodsCapability}>(/private/NFTMethodsCapability)

        self.adminRef = adminPrivateCap
     
        self.JukeboxStoragePath = /storage/Jukebox
        self.JukeboxPublicPath  = /public/Jukebox
        
        self.account.save<@Jukebox>(<- create Jukebox(), to: self.JukeboxStoragePath)
        self.account.link<&{JukeboxPublic}>(self.JukeboxPublicPath, target:self.JukeboxStoragePath)
    }

}