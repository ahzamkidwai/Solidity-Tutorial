// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AhzamCoin {
    address public owner;
    uint256 public totalSupply;
    mapping(address => uint256) public balances;

    constructor() {
        owner = msg.sender;
    }

    // Minting tokens
    function mintTokens(uint256 amount) public {
        require(owner == msg.sender, "User is not OWNER");
        balances[msg.sender] += amount;
        totalSupply += amount;
    }

    // Minting tokens to friend
    function mintTokenToFriend(uint256 amount, address to) public {
        require(owner == msg.sender, "User is not OWNER. No transaction is allowed!!!");
        balances[to] += amount;
        totalSupply += amount;
    }

    // Transfer token to friend
    function transferTokenToFriend(uint256 amount, address to) public{
        uint256 existingBalances = balances[msg.sender];
        require(existingBalances >= amount, "You dont have sufficient balances for transaction.");
        balances[msg.sender] -= amount;
        balances[to] += amount;

    }
}
