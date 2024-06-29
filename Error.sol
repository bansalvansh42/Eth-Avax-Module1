// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


// ETH + AVAX PROOF: Intermediate EVM Course
//demonstrates Error Handling Techniques using assert, revert, and require functions.
// I have created a Pizza Order Smart Contract


contract error {

    address public owner;
    uint public orderCount;
    constructor() {
        owner = msg.sender;
    }

    struct Order {
        address client;
        uint Npizza;
        bool delivered;

    }

    mapping(uint => Order) public Orders;

    error throwError(string,address);

    function placeOrder(uint pizzaSelection) public payable returns(uint){
        require(msg.sender== owner,"Caller is not the owner");


         
    if(pizzaSelection>0){
        Order memory newOrder= Order(msg.sender,pizzaSelection,false);
        orderCount++;
        Orders[orderCount] =newOrder;
        return orderCount;
    }

    else {
        revert throwError("Total number of pizza ordered should be more than zero",msg.sender);
    }
    }

    function delivered(uint orderNumber) public{
        Orders[orderNumber].delivered = true;
        assert(Orders[orderNumber].delivered==true);
    }
}


