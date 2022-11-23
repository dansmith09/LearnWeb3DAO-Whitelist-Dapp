//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {

    /// Defining uint8 variable for max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    // Create a mapping of whitlistedAddresses
    // if an address is whitelisted, we would set it to true. It is false bt default for all other addresses.
    /// create a mapping of addresses with boolean values called whitelistedAddresses
    mapping(address => bool) public whitelistedAddresses;

    // numAddressesWhitelisted will be used to keep track of how many addresses have been whitelisted
    // NOTE: Don't change this variable name, as it will be part of verification
    /// Defining uint8 variable how many addresses have been whitelisted
    uint8 public numAddressesWhitelisted;

    // Setting the Max number of whitelisted addresses
    // User will put the value at the time of deployment
    /// Constructor code will run once when the contract is deployed
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /* 
        addAddressToWhitelist - This function adds the address of the sender to the whitelist
    */
    function addAddressToWhitelist() public {
        // check if the user has already been whitelisted
        require(!whitelistedAddresses[msg.sender]);
        // check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not throw an error
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Sorry, all whitelist spots have been taken :(");
        // Add the address which called the function to the whitelistedAddress array /// (mapping)
        whitelistedAddresses[msg.sender] = true;
        // Increment the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }
}