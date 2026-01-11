// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;


/* 
* @title: RSA Cryptography
* @author: Tianchan Dong
* @notice: This contracts serves as an illustration of the cryptographic 
* mechanics in a blockchain.
*/ 

contract RSA{

    // Private key: (e, n)
    // Public key: (d, n)
    // For simplicity, the e(encrypt), d(decrypt) and n(modulo) 
    // has been "generated" for you. Do not modify
    uint private ENCRYPT = 7;
    uint private DECRYPT = 3;
    uint private MOD = 33;

    /// @param data The message to be hashed
    /// @return The hash value, or message digest, of the input
    function hash(string calldata data) public view returns(uint){
        uint digest = 0;
        // Convert the string to bytes

        // Add the decimal value of each character together

        // Take the modulo of this sum and return the result
        return;
    }

    /// @param data the original message
    /// @return a signed message of the *digest*
    function Sign_Message(string calldata data) public view returns(uint){
        // Called the hash function to create the message digest from user data

        // Sign the message with private key (digest^e%n)
        uint signed = ;

        return signed;
    }

    /// @param data the original message
    /// @return true if the public key decrypts the signed message into the digest.
    function verify(string calldata data) public view returns(bool){
        // Create a signed message
        uint signed_message = ;

        // Decrypt using public key
        uint verify_with_public_key = ;

        // Get the digest
        uint digest = ;

        // Check if the decrypted result matches the message digest
        return ;

    }
}