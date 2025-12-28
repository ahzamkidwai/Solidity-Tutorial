// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // Always Mention Solidity Version

contract Calculator {
    uint256 value;

    // Constructor
    constructor(uint256 _initialData) {
        // This is just convention to write parameter in constructor starting with "_" such as "_initalData"
        value = _initialData;
    }

    // User defined Functions
    function add(uint256 _value) public {
        value = value + _value;
    }

    function sub(uint256 _value) public {
        value = value - _value;
    }

    function mul(uint256 _value) public {
        value = value * _value;
    }

    function div(uint256 _value) public {
        require(_value != 0, "Value cannot be ZERO");
        value = value / _value;
    }

    // Function to get value
    function getValue() public view returns (uint256) {
        return value;
    }
}
