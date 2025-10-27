// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// this is the base contract

contract BasePay {
    mapping (address => uint) public balances;

    function deposit() public payable virtual {
        balances[msg.sender] += msg.value;
    }

}