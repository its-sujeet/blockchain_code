// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BasePay {
    mapping (address => uint) balances;

    function deposit() public payable virtual {
        balances[msg.sender] += msg.value;
    }

}