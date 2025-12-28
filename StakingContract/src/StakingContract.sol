pragma solidity ^0.8.13;

// Create two functions => One where people can stake their tokens (native ETH) and another where they can withdraw their half of their staked tokens (native ETH).

contract StakingContract {
    uint256 public totalStakedAmount;
    mapping(address => uint256) public stakedBalances;

    constructor() {
        totalStakedAmount = 0;
    }

    function stake() external payable {
        uint256 _amount = msg.value;
        require(_amount > 0, "Amount must be greater than zero");
        require(
            msg.value == _amount,
            "Sent value must match the staking amount"
        );
        totalStakedAmount += _amount;
        stakedBalances[msg.sender] += _amount;
    }

    function withdrawHalf(uint256 _amount) external {
        require(_amount > 0, "Amount must be greater than zero");
        require(
            _amount <= stakedBalances[msg.sender],
            "Insufficient staked Balances"
        );

        stakedBalances[msg.sender] -= _amount;
        totalStakedAmount -= _amount;

        payable(msg.sender).transfer(_amount / 2);
    }
}
