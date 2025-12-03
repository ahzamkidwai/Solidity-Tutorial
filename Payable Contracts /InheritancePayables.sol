// SPDX-License-Identifier: MIT


// Create a will contract

// 1. Every User will deploy their own will contract.
// 2. When initialized, set the owner to be the person initializing.
// 3. The owner can define a recipient in the constructor.
// 4. Owner should be allowed to change the recipient. 
// 5. Owner should be allowed to interact with the contract via ping function
// 6. If ping hasn't been called for > 1 year, the recipient should be allowed to call a drain function.


pragma solidity ^0.8.26;

contract Inheritance {
    uint startTime;
    uint tenYears;
    uint public lastVisited;
    address owner;
    address payable recipient;

    constructor(address payable _recipientAddress) {
        tenYears = 1 hours * 24 * 365 * 10;
        startTime = block.timestamp;
        lastVisited = block.timestamp;
        owner = msg.sender;
        recipient = _recipientAddress;
    }

    modifier onlyOwner () {
        require(msg.sender == owner);
        _;
    }
    
    modifier onlyRecipient() {
        require(msg.sender == recipient);
        _;
    }

    function deposit() public payable onlyOwner{
        lastVisited = block.timestamp;
    }

    function ping() public onlyOwner {
        lastVisited = block.timestamp;
    }

    function claim() external onlyRecipient{
        require(lastVisited < block.timestamp - tenYears);
        payable(recipient).transfer(address(this).balance);
    }

}
