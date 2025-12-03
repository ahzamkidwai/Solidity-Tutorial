// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Money {
    uint public totalMoney;

    constructor () payable {
        
    }

    function deposit() public payable {
        totalMoney += msg.value;
    }

    function withdraw(address payable ad) public {
        require(totalMoney <= address(this).balance, "Contract balance is too low"); 
        
        payable(ad).transfer(totalMoney);
        totalMoney = 0;
    }
}
