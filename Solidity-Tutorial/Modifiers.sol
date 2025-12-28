// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Storage {
    uint256 number;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    // Modifiers are simply the middlewares in express 
    modifier onlyOwner() {
        require(owner == msg.sender, "Caller is not the contract owner");
        _; // like next() in middlewares of express
    }

    function add(uint a) public onlyOwner {
        // require(owner == msg.sender, "Caller is not the contract owner (IN ADD)");
        number = number + a;
    }

    function sub(uint a) public onlyOwner {
        // require(owner == msg.sender, "Caller is not the contract owner (IN SUB)");
        number = number - a;
    }

    function getNumber() public view returns (uint256) {
        return number;
    }
}
