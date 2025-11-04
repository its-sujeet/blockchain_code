// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract DepositLedger {
    mapping(address => uint256) private _balances;
    address public immutable owner;


    constructor() {
        owner = msg.sender;
    }

    function deposit() external payable {
        require(msg.value > 0, "No ETH sent");
        _balances[msg.sender] += msg.value;
    }

    function getBalance(address who) external view returns (uint256) {
        return _balances[who];
    }
}
