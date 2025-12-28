// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample {
    // Declare the shape of the Event.
    event TransferEthereum(
        address indexed from,
        address indexed to,
        uint256 value
    );

    // A function that emits the Transfer events
    function transferEthereum(address to, uint256 value) public {
        // Emitting the event with the specified parameters.
        emit TransferEthereum(msg.sender, to, value);
    }
}
