// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

// all the versions before 0.8.0 cannot check uint variable and after the range set the varialbe to zero 

contract SafeMath{

    uint8 public bigNumber = 255;

    function incrementBigNumber() public {
        unchecked {bigNumber = bigNumber + 1;}
    }
}