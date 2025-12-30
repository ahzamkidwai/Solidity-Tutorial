// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OrcaCoin is ERC20 {
    address public stakingContractAddress;
    address owner;

    constructor(address _stakingContractAddress) ERC20("OrcaCoin", "ORCA") {
        stakingContractAddress = _stakingContractAddress;
        owner = msg.sender;
    }

    function mint(address _account, uint256 _amount) external {
        require(
            msg.sender == stakingContractAddress,
            "Only staking contract can mint"
        );
        _mint(_account, _amount);
    }

    function updateStakingContractAddress(address _newAddress) external {
        require(msg.sender == owner, "Only owner can update address");
        stakingContractAddress = _newAddress;
    }
}
