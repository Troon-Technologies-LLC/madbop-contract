import NFTContract from  0xc3efbc9926eb00eb
import MadbopContract from 0xe9c0c532df97e099
transaction (){
  
    prepare(acct: AuthAccount) {
        let actorResource = acct.getCapability
            <&{NFTContract.NFTMethodsCapability}>
            (/private/NFTMethodsCapability)
            .borrow() ?? 
            panic("could not borrow a reference to the NFTMethodsCapability interface")

            MadbopContract.adminRef.borrow()!.mintNFT(templateId: UInt64(9), account: 0xf3e107721f7302e7)

    }
}