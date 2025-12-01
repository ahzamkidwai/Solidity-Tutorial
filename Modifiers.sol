// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Storage {
    uint256 number;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    function add(uint a) public {
        require(owner == msg.sender, "Caller is not the contract owner (IN ADD)");
        number = number + a;
    }

    function sub(uint a) public {
        require(owner == msg.sender, "Caller is not the contract owner (IN SUB)");
        number = number - a;
    }

    function getNumber() public view returns (uint256) {
        return number;
    }
}
