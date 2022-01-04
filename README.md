## Overview
## Summary of NFTContract
NFTContract is a Non Fungible Token (NFT) standard for Flow blockchain. 
It offers a powerful set while keeping unnecessary complexity to a minimum and focus on efficiency. 
Our Contract consists of different parts like Brand, Schema, Templates and NFTs, which serve different purposes and often reference each other.

## Brand
A brand is an intangible marketing or business concept that helps people identify a company, product, or individual. People often confuse brands with things like logos, slogans, or other recognizable marks. Brand is a symbol of organization that represent parent company. Organizations can create their own Brands in FLOW Blockchain using NFTContract. We have set of restrictions on flow Accounts. In order to create a brand you need to be whitelisted(Approval of Super Admin).

### Schema
Schemas are used to define a data structure of NFT. Schema is like an interface that used for creating a new template(defined later) using the structure we defined in schema. A Schema is a collection of Key attributes. A schema is owned by an account. Schema objects are logical structures. Keys and Values in schemas hold data types, or can consist of a definition only, such as a view or synonym. We are supporting following datatypes in schema:
- String
- Int 
- Fix64
- Bool  
- Address
- Array
- Any

## Template
Templates are blueprints of NFTs. For creating NFTs, we use Templates as defined schemas. Flow Blockchains are storing metadata offchain but only we are creating a structure where we can store metadata onchain.


## Summary of Madbop Contract
Madbop is a Music Collection Platform; where we have different entities, roles and access levels. Artist can sell their NFT through MadbopContract. In MadbopContract, we have JukeBox through which Artist can sell their NFTs. JukeBox is the collection of NFTs which is created by Admin. Users can view and purchase that jukeBox with provided payment methods. Each JukeBox has a date after that user can see NFTs of that JukeBox. JukeBox may contains different types of NFT.
Technically, JukeBox is a struct with the following structure:
```
    pub struct  JukeboxData {
        pub let templateId: UInt64
        pub let openDate: UFix64
    }
```
For more depth details use link [see Documentation](Docs/Technical_Document.md)


## ✨ Getting Started

### Clone Project and Install Dependencies 
[see Documentation](Docs/Dependencies.md)


## Directory Structure of Project
[see Documentation](Docs/Directory_Structure.md)

## Technical Documentation of Madbop Contract
[see Documentation](Docs/Technical_Document.md)


## Test Cases (using Javascript)
[see Documentation](test/js/README.md)

