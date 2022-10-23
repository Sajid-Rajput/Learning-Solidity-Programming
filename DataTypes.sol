//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract dataTypes{
   // uint8 stores 0 - 255 numbers
   // uint16 store 0 = 63535 numbers
    uint8 public Uvalue;
    int public value;
    address public address1;
    string name;
    // bytes limits from 32 only
    bytes32 code = "cat";

    // This function set values to the variables
    function setValues(uint8 _Uvalue, int _value, address _address1, string memory _name) public {
        Uvalue = _Uvalue;
        value = _value;
        address1 = _address1;
        name = _name;
    }

    //The rest of the functions get the values to the variable
    function printUvalue() public view returns(uint8){
       return Uvalue;
    }

    function printvalue() public view returns(int){
       return value;
    }

    function printaddress1() public view returns(address){
       return address1;
    }

    function printname() public view returns(string memory){
       return name;
    }
}