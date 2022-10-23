// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

// Array: Dynamic or Fixed sized
// Insert(push), get, update, pop, delete, length
// Creating Array in memory
// Returning Array from function

contract solidityArrays{

    uint8[] public numbers = [1,2,3,4]; //Dynamic Array
    uint8[4] public fixedNumbers = [5,6,7,8]; //Fixed Size Array

    function arrayFunctions() public {
        numbers.push(55);
        numbers.push(99);
        uint8 num = numbers[2];
        numbers[1] = 77;
        delete numbers[0];
        numbers.pop();
        uint256 length = numbers.length;
    }

    function returnArray() public view returns(uint8[] memory){
        return numbers;
    }

}