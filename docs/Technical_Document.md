## Technical Summary and Code Documentation

## Instructions for Create Brand, Create JukeBox Schema, Create Jukebox, Mint JukeBox and Open JukeBox

A common order of creating NFT would be

- Create Admin Account with `transaction/setupAdminAccount.cdc`.
- Owner then create that account as Madbop-Admin and gives ability to create Brand, Schema and Template for Madbop contract with `transactions/AddAdminAccount.cdc`
- Create new Brand with `transactions/createBrand.cdc` using Admin Account.
- Create new NFT Schema with `transactions/createNFTSchema.cdc` using Admin Account.
- Create new JukeBox Schema with `transactions/createJukeBoxSchema.cdc` using Admin Account.
- Create new JukeBox Template with `transactions/createJukeboxTemplate.cdc` using Admin Account.
- Create NFT Receiver with `transaction/setupAccount.cdc`.
- Mint JukeBox with `transaction/mintNFT.cdc`.
- Open JukeBox with `transaction/openJukebox.cdc`.

You can also see the scripts in `scripts` to see how information
can be read from the MadbopNFTs and Madbop (Jukebox) smart-contracts.

### MadbopNFTs and Madbop Events

- Contract Initialized ->
  ` pub event ContractInitialized()`
  This event is emitted when the `MadbopNFTs` will be initialized.

- Event for Brand ->
  `pub event BrandCreated(brandId: UInt64, brandName: String, author: Address, data: {String:String})`
  Emitted when a new Brand will be created and added to the smart Contract.

- Event for Brand Updation ->
  `pub event BrandUpdated(brandId: UInt64, brandName: String, author: Address, data: {String:String}) `
  Emitted when a Brand will be update

- Event for Schema ->
  `pub event SchemaCreated(schemaId: UInt64, schemaName: String, author: Address)`
  Emitted when a new Schema will be created

- Event for Template ->
  `pub event TemplateCreated(templateId: UInt64, brandId: UInt64, schemaId: UInt64, maxSupply: UInt64)`
  Emitted when a new Template will be created

- Event for Template Mint ->
  `pub event NFTMinted(nftId: UInt64, templateId: UInt64, mintNumber: UInt64)`
  Emitted when a Template will be Minted and save as NFT

- Event for JukeBox Created ->
  `pub event JukeboxCreated(templateId:UInt64, openDate:UFix64)`
  Emitted when a new JukeBox is created

- Event for JukeBox Opened ->
  `pub event JukeboxOpened(nftId:UInt64,receiptAddress:Address?)`
  Emitted when a new JukeBox is created

## MadbopNFTs Addresses

`MadbopNFTs.cdc`: This is the main MadbopNFTs smart contract that defines the core functionality of the NFT.

| Network | Contract Address     |
| ------- | -------------------- |
| Testnet | `0xe8aeee7a48e71d78` |

## Madbop Addresses

`MadbopContract.cdc`: This is the madbop smart contract that has the functionality of the jukebox.

| Network | Contract Address     |
| ------- | -------------------- |
| Testnet | `0xb5660858a796e6ba` |

### Deployment Contract on Emulator

- Run `flow project deploy --network emulator`
  - All contracts are deployed to the emulator.

After the contracts have been deployed, you can run the sample transactions
to interact with the contracts. The sample transactions are meant to be used
in an automated context, so they use transaction arguments and string template
fields. These make it easier for a program to use and interact with them.
If you are running these transactions manually in the Flow Playground or
vscode extension, you will need to remove the transaction arguments and
hard code the values that they are used for.
