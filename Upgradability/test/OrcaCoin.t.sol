// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {OrcaCoin} from "../src/OrcaCoin.sol";

contract OrcaCoinTest is Test {
    OrcaCoin orcaCoin;

    function setUp() public {
        orcaCoin = new OrcaCoin(address(this));
    }

    function testInitialSupply() public view {
        assertEq(orcaCoin.totalSupply(), 0);
    }

    function test_Revert_Mint() public {
        address attacker = address(0xB5C66C121B2B3bc9C76F5dd893FdAEc4e8Df8d47);
        vm.startPrank(attacker);
        vm.expectRevert("Only staking contract can mint");
        orcaCoin.mint(attacker, 1000);
    }

    function testMint() public {
        orcaCoin.mint(address(this), 1000);
        assertEq(orcaCoin.balanceOf(address(this)), 1000);
    }

    function testChangeStakingContractAddress() public {
        address newStakingContractAddress = address(
            0xB5C66C121B2B3bc9C76F5dd893FdAEc4e8Df8d47
        );
        // vm.startPrank(newStakingContractAddress);
        // orcaCoin.updateStakingContractAddress(newStakingContractAddress);
        vm.startPrank(address(this));
        orcaCoin.updateStakingContractAddress(address(this));
        orcaCoin.mint(newStakingContractAddress, 1000);
        assertEq(orcaCoin.balanceOf(newStakingContractAddress), 1000);
    }
}
