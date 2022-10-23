// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./PriceConverter.sol";

error NotOwner();

contract Fundme{
    // wallet and smart contract both able to hold blockchain tokens like Ethereum

    using PriceConverter for uint256;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    // constant variable must be in Capital Letter
    uint256 public constant MINIMUM_USD = 50 * 1e18;

    // immutable is just like constant but it is stored in the byte code 
    address public immutable i_owner;

    constructor(){
        i_owner = msg.sender;
    }

    function Fund() public payable {
        //msg.value is considered as the 1st variable that passed in getConversionRate() function
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Transaction can't be performed");// 1e18 == 1 * 10 ** 18 == 1000000000000000000
        // Revert: If require statement is false then the gas used after require statement is payback to the original account
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }
    
    function WithDraw() public onlyOwner{
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex = funderIndex + 1){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        // Resettig the array
        funders = new address[] (0);
        
        // There are three ways to transfer the Ethereum or native blockchain tokens

        //transfer
        // payable(msg.sender).transfer(address(this).balance);

        //send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send Failed")

        //Recommended way: call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call Failed");
    }

    modifier onlyOwner {
        // require(msg.sender == owner, "Sender is not Owner");
        if(msg.sender != i_owner) { revert NotOwner(); }
        _;
    }

    //<- Fallback() and receive() function ->
    // When transaction is send it uses receive function 
    // When transaction is send along with the data fallback function is called
    // When only data is send then only fallback() function is called
    // receive and fallback function must be external
    // receive function is alway payable
    // fallback function is payable when we want to receive transaction using fallback function

    receive() external payable{
        Fund();
    }

    fallback() external payable{
        Fund();
    }

    //But when we use the official fund button it's cost less gas
}