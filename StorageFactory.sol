// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./SimpleStorage.sol";

contract CreateNewSimpleStorage{

    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        SimpleStorage simplestorage = new SimpleStorage();
        simpleStorageArray.push(simplestorage);
    }

    function SFvalue(uint8 _SimpleStorageIndex, uint16 _favouriteNumber) public {
        SimpleStorage simplestorage = simpleStorageArray[_SimpleStorageIndex];
        simplestorage.store(_favouriteNumber);
    }

    function GFvalue(uint8 _SimpleStorageIndex) public view returns(uint256){
        SimpleStorage simplestorage = simpleStorageArray[_SimpleStorageIndex];
        return simplestorage.retrieve();
    }
}