// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract advancedMapping{
    struct donorDetails{
        string name;
        uint8 age;
        string country;
        uint32 donation;
    }


    mapping(address=>donorDetails) public donor;

    function setDetails(string memory _name, uint8 _age, string memory _country, uint32 _donation) public {
        donor[msg.sender] = donorDetails(_name, _age, _country, donor[msg.sender].donation + _donation);
    }

    function deleteDonor() public {
        delete donor[msg.sender];
    }
}