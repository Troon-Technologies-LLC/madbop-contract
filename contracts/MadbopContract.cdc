import NFTContract from "./NFTContract.cdc"
import NonFungibleToken from "./NonFungibleToken.cdc"

pub contract MadbopContract {

    // event for madbop data initalization
    pub event MadbopDataInitialized(brandId: UInt64, jukeboxSchema: [UInt64], nftSchema :[UInt64])
    // event when madbop data is updated
    pub event MadbopDataUpdated(brandId: UInt64, jukeboxSchema: [UInt64], nftSchema: [UInt64])
    // event when a jukebox is created
    pub event JukeboxCreated(templateId: UInt64, openDate: UFix64)
    // event when a jukebox is opened
    pub event JukeboxOpened(nftId: UInt64, receiptAddress: Address?)
    // path for jukebox storage
    pub let JukeboxStoragePath : StoragePath
    // path for jukebox public
    pub let JukeboxPublicPath : PublicPath
    // dictionary to store Jukebox data
    access(self) var allJukeboxes: {UInt64: JukeboxData}
    // dictionary to store madbop data
    access(self) var madbopData: MadbopData
    // capability of NFTContract of NFTMethods to call the mint function on this capability
    access(contract) let adminRef : Capability<&{NFTContract.NFTMethodsCapability}>

    // All methods called or accessed by only the admin
    pub struct MadbopData {
        pub var brandId: UInt64
        access(contract) var jukeboxSchema: [UInt64]
        access(contract) var nftSchema: [UInt64]

        init(brandId: UInt64, jukeboxSchema: [UInt64], nftSchema :[UInt64]){
            self.brandId = brandId
            self.jukeboxSchema = jukeboxSchema
            self.nftSchema = nftSchema
        }

        pub fun updateData(brandId: UInt64,jukeboxSchema: [UInt64], nftSchema: [UInt64]){
            self.brandId = brandId
            self.jukeboxSchema = jukeboxSchema
            self.nftSchema = nftSchema
        }
    }

    pub struct JukeboxData {
        pub let templateId: UInt64
        pub let openDate: UFix64

        init(templateId: UInt64,openDate: UFix64){
            self.templateId = templateId
            self.openDate = openDate
        }
    }

    pub resource interface JukeboxPublic{
        //open jukebox function making it public to call by other users
        pub fun openJukebox(jukeboxNFT: @NonFungibleToken.NFT, receiptAddress :Address)
    }

    pub resource Jukebox: JukeboxPublic {
        pub fun createJukebox(templateId: UInt64, openDate: UFix64){
            pre {
                templateId != nil: "template id must not be null"
                MadbopContract.allJukeboxes[templateId] == nil: "Jukebox already created with this template id"
                openDate > 0.0 : "Open date should be greater than zero"
            }    
            let templateData = NFTContract.getTemplateById(templateId: templateId)
            assert(templateData != nil, message: "specific template id does not exist")
            // Brand Id of template must be Madbop
            assert(templateData.brandId == MadbopContract.madbopData.brandId, message: "Invalid Brand id")
            //Template must be the Jukebox
            assert(MadbopContract.madbopData.jukeboxSchema.contains(templateData.schemaId), message: "Template is not a Jukebox")
            assert(openDate >= getCurrentBlock().timestamp, message: "open date must be greater than current date")
            //Check all templates under the jukexbox are created or not
            var allNftTemplateExists = true;
            let allIds = templateData.immutableData["nftTemplates"]! as! [AnyStruct]
            for tempID in allIds {
                    let nftTemplateData = NFTContract.getTemplateById(templateId: UInt64(tempID as! Int) )
                    if(nftTemplateData == nil){
                        allNftTemplateExists = false
                        break
                    } 
            }
            assert(allNftTemplateExists, message: "Invalid NFTs")
            let newJukebox = JukeboxData(templateId: templateId,openDate: openDate)
            MadbopContract.allJukeboxes[templateId] = newJukebox
            //Call event
            emit JukeboxCreated(templateId: templateId, openDate: openDate)
        }

        //update madbop data function will be updated when a new user create a new brand with its own data
        //and pass new user details
        pub fun updateMadbopData(brandId: UInt64, jukeboxSchema: [UInt64], nftSchema: [UInt64]){
            pre {
                brandId!=nil:"brand id must not be null"
                jukeboxSchema !=nil:"jukebox schema array must not be null"
                nftSchema !=nil:"nft schema array must not be null"
            }
            MadbopContract.madbopData.updateData(brandId: brandId, jukeboxSchema: jukeboxSchema, nftSchema: nftSchema)
            //Call event
            emit MadbopDataUpdated(brandId: brandId,jukeboxSchema: jukeboxSchema, nftSchema: nftSchema)

        }

        //open jukebox function called by user to open specific jukebox to mint all the nfts in and transfer it to
        //the user address
        pub fun openJukebox(jukeboxNFT: @NonFungibleToken.NFT, receiptAddress: Address){
            pre {
                jukeboxNFT !=nil : "jukebox nft must not be null"
                receiptAddress !=nil: "receipt address must not be null"
            }
            var jukeboxNFTdata = NFTContract.getNFTDataById(nftId: jukeboxNFT.id)
            var jukeboxTemplateData = NFTContract.getTemplateById(templateId: jukeboxNFTdata.templateID)
            //Check if it is regiesterd or not
            assert(MadbopContract.allJukeboxes[jukeboxNFTdata.templateID]!=nil, message: "Jukebox is not regiestered") 
            //Check if current date is greater or equal than opendate 
            assert(MadbopContract.allJukeboxes[jukeboxNFTdata.templateID]!.openDate <= getCurrentBlock().timestamp, message: "open current date")
            let allIds = jukeboxTemplateData.immutableData["nftTemplates"]! as! [AnyStruct]
            for tempID in allIds {
                MadbopContract.adminRef.borrow()!.mintNFT(templateId: UInt64(tempID as! Int), account: receiptAddress)
            }
            //will add an if condition
            emit JukeboxOpened(nftId: jukeboxNFT.id,receiptAddress: self.owner?.address)
            destroy jukeboxNFT
        }
    }

    pub fun getAllJukeboxes(): {UInt64: JukeboxData} {
        pre {
            MadbopContract.allJukeboxes !=nil: "jukebox does not exist"
        }
        return MadbopContract.allJukeboxes
    }

    pub fun getJukeboxById(jukeboxId: UInt64): JukeboxData {
        pre {
            MadbopContract.allJukeboxes[jukeboxId]!=nil: "jukebox id does not exist"
        }
        return MadbopContract.allJukeboxes[jukeboxId]!
    }

    pub fun getMadbopData(): MadbopData {
        return MadbopContract.madbopData
    }

    init(){
        self.allJukeboxes = {}
        self.madbopData = MadbopData(brandId: 0, jukeboxSchema: [], nftSchema: [])
        emit MadbopDataInitialized(brandId: 0,jukeboxSchema: [], nftSchema: [])
        var adminPrivateCap = self.account.getCapability
            <&{NFTContract.NFTMethodsCapability}>(NFTContract.NFTMethodsCapabilityPrivatePath)
        self.adminRef = adminPrivateCap
        self.JukeboxStoragePath = /storage/MadbopJukebox
        self.JukeboxPublicPath = /public/MadbopJukebox
        self.account.save(<- create Jukebox(), to: self.JukeboxStoragePath)
        self.account.link<&{JukeboxPublic}>(self.JukeboxPublicPath, target:self.JukeboxStoragePath)
    }
}
