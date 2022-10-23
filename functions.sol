//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract solidityFunctions{

    //By default the variable is private in type.
    //By default the value of age is 0
    uint8 age;

    function setter(uint8 getAge) public{
        age = getAge;
    }

    //If we don't change state variable we don't need to spend gas
    function getter() public view returns(uint8){
        return age+1;
    }

    function returnName() public pure returns(string memory){
        string memory greeting = "Hello! Muhammad Sajid Ali Khan";
        return greeting;
    }

    // view: when we want to read the state variable value
    // pure: when we don't touch the state variable and want to return a value and algo
}