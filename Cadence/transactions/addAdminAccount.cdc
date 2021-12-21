import NFTContract from  0xd4221a1979538992
import NonFungibleToken from 0x631e88ae7f1d7c20

transaction() {
    prepare(signer: AuthAccount) {

        // get the public account object for the Admin
        let TemplateAdminAccount = getAccount(0xa888f479b6525db2)

        // get the public capability from the Admin's public storage
        let TemplateAdminResource = TemplateAdminAccount.getCapability
            <&{NFTContract.UserSpecialCapability}>
            (/public/UserSpecialCapability)
            .borrow()
            ?? panic("could not borrow reference to UserSpecialCapability")

        // get the private capability from the Authorized owner of the AdminResource
        // this will be the signer of this transaction
        //
        let specialCapability = signer.getCapability
            <&{NFTContract.SpecialCapability}>
            (NFTContract.SpecialCapabilityPrivatePath) 

        // if the special capability is valid...
        if specialCapability.check() {
            // ...add it to the TemplateAdminResource
            TemplateAdminResource.addCapability(cap: specialCapability)
            log("capability added")
        } else {
            // ...let the people know we failed
            panic("special capability is invalid!")
        }
    }
}