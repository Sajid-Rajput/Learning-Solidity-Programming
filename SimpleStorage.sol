// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

//pragma solidity ^0.8.8; Any solidity compiler greater than 0.8.8
//pragma solidity 0.8.8; Specify the compiler version
//pragma solidity >=0.8.8 <0.9.0; Any compiler greater than or equal to 0.8.8 but less than 0.9.0 is valid for this contract

// contract keyword tells the next piece of code is contract.
contract SimpleStorage{
    // Date Types: boolean, uint(only positive integers), int, string, address, bytes
    // bool hasFavouriteNumber = true;
    // uint256 favouriteNumber = 20;
    // string favouriteString = "love"; // string is the type of objects
    // int256 favouriteInteger = -5;
    // address favouriteAddress = 0xd00861E97faC75Fd183d28D57f04476dc3c25102;
    // bytes32 favouriteBytes = "cat"; // It represent the string with some kind of numbers

    //This get initialized to zero.
    uint256 public favouriteNumber;
    mapping(string => uint256) public nameToFavouriteNumber;

    function store(uint256 _favouriteNumber) public virtual{
        favouriteNumber = _favouriteNumber;
    }

    // <- view and pure function don't spent gas for execution. ->
    function retrieve() public view returns(uint256) {
        return (favouriteNumber);
    }

    // <- Pure functions additionally disallow you to read from blockchain state ->
    //It returns any algorithm or any value

//     function add() public pure returns(uint256) {
//         return (1 + 1);
//     }
       // If a function that doesn't cost gas called inside the calling function then it's also cost gas

    struct People{
        string name;
        uint256 favouriteNumber;
    }

    // int256[] public favouriteNumberList; This is the way for creating an array
    People[] public people;

    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        People memory newPerson = People({name: _name, favouriteNumber: _favouriteNumber});
        nameToFavouriteNumber[_name] = _favouriteNumber;
        // <- Alternative Ways ->
        // People memory newPerson = People(_name, _favouriteNumber);
        //people.push(People(_name, _favouriteNumber));


        people.push(newPerson);
    }

        //<- evm can access and store information in six places ->
    // Stack - memory - storage = calldata - code - logs

    // calldata, memory, storage
    // Calldata - calldata is a temporary variable but it can't be modified
    // Memory - memory is a temporary variable but it can be modified
    // storage - storage is just act like a global variable.

    // <- Mapping ->
    // A mapping is a data structure where where a key is "mapped" to a single value/
    // A easy way to think about mapping is as a dictionary
}