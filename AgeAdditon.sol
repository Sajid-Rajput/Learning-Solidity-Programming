//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;


contract addition {
    uint256 age = 20;

    function additionAge() internal {
        age += 1;
    }

    function showage() public returns(uint256) {
        additionAge();
        return age;
    }
}