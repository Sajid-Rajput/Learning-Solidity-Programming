// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract CalldataInSolidity{
    // calldata acquires less gas than memory
    // the data in call data only takes the input one time and never change the data
    function Calldata(uint8[] calldata arr) public {
        Calldata1(arr);
        Memory1(arr);
    }

    function Memory(uint8[] memory arr) public {
        Memory1(arr);
        // Calldata1(arr); // We can't pass data from memory to call data
    }

    function Memory1(uint8[] memory arr) public {

    }

    function Calldata1(uint8[] calldata arr) public {

    }
}