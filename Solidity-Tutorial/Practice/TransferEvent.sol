// Build a token contract (no ERC20 yet). 
// Store balances Implement transfer(address to, uint amount) 
// Emit a Transfer event.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleToken {
    mapping(address => uint256) public balances;

    event Transfer(address indexed from, address indexed to, uint256 amount);

    function mint(uint256 amount) external {
        require(amount > 0, "Mint amount must be greater than 0");
        balances[msg.sender] += amount;
    }

    function transfer(address to, uint256 amount) external {
        require(to != address(0), "Invalid address");
        require(amount > 0, "Amount must be greater than 0");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
        balances[to] += amount;

        emit Transfer(msg.sender, to, amount);
    }

    function balanceOf(address user) external view returns (uint256) {
        return balances[user];
    }
}
