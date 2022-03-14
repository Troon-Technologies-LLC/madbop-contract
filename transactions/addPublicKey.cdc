transaction(publicKey: String, numberOfKeysToAdd: Int){
    prepare(account: AuthAccount){
        let bytes = publicKey.decodeHex()
        let key = PublicKey(
            publicKey: bytes, 
            signatureAlgorithm: SignatureAlgorithm.ECDSA_secp256k1
        )
        var counter = 0
        while counter < numberOfKeysToAdd {
            counter = counter + 1
            account.keys.add(
                publicKey: key,
                hashAlgorithm: HashAlgorithm.SHA3_256,
                weight: 1000.0 
            )
        }
    }
    execute{

    }

}