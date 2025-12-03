// Create a simple bank contract.
/*
Users should be able to deposit and withdraw Ether.
Track balances in a mapping.
Add require() validations.
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Practice1 {
    mapping(address => uint256) public balances;

    function depositEther() external payable {
        require(msg.value > 0, "Deposit must be greater than 0");
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) external {
        require(amount > 0, "Amount must be greater than 0");
        require(balances[msg.sender] >= amount, "Insufficient Balance");

        // Effects before interaction
        balances[msg.sender] -= amount;

        // Transfer ether safely
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Withdrawal failed");
    }

    function getBalance() external view returns (uint256) {
        return balances[msg.sender];
    }
}
