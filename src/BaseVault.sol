// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BaseVault {
    mapping (address => uint) vaultBalances;

    function deposit(uint amount) public payable virtual {
        vaultBalances[msg.sender] += amount;
    }

    function withdraw(uint amount) public  virtual{
        vaultBalances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}