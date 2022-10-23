// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract solidityMapping{
    // Mapping used only inside the contract
    // key is value, enum, contract

    mapping(uint8=>string) public emp_id;

    function getvalue() public{
        emp_id[10] = "Hassan";
        emp_id[11] = "Sajid";
        emp_id[34] = "Raza";
        emp_id[33] = "Farhan";
        emp_id[32] = "Wali";
    }

    function returnValue(uint8 _key) public view returns(string memory){
        return emp_id[_key];
    }
}