// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

interface IContract1 {
    function getNum() external view returns (uint);
    function addOne() external;
}

contract Contract2 {
    constructor() {
        
    }

    function proxyAdd() public  {
        IContract1(0x406AB5033423Dcb6391Ac9eEEad73294FA82Cfbc).addOne();
    }

    function proxyGet() public view returns(uint) {
        uint value = IContract1(0x406AB5033423Dcb6391Ac9eEEad73294FA82Cfbc).getNum();
        return value;
    }
}
