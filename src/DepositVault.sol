// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract DepositVault {

    mapping (address => uint) public balances;

    function deposit() external payable{
        require(msg.value > 0, "Must send ETH");
        balances[msg.sender] += msg.value;
    }

    function getBalance(address user) external view returns (uint) {
        return balances[user];
    }
}