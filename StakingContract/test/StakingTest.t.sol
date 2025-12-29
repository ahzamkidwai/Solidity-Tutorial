// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/StakingContract.sol";

contract StakingTestContract is Test {
    StakingContract c;

    // ✅ Allow this contract to receive ETH
    receive() external payable {}

    function setUp() public {
        c = new StakingContract();
    }

    function testStake() public {
        uint256 value = 10 ether;
        c.stake{value: value}();

        assertEq(c.totalStakedAmount(), value);
    }

    function testWithdrawHalf() public {
        uint256 value = 10 ether;
        c.stake{value: value}();

        c.withdrawHalf(value);

        assertEq(c.totalStakedAmount(), 0);
    }
}
