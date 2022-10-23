// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract solidityStorage{
    // storage used for static variable
    uint8[] public arr = [1,2,3,4,5];

    // storage directly points to the static variale
    function Storage() public{
        uint8[] storage copyArray = arr;
        copyArray[1] = 92;
    }

    // memory creates a copy of the given variable
    function Memory() public view{
        uint8[] memory copyArray = arr;
        copyArray[1] = 100;
    }
}