// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./BaseVault.sol";


contract SecureVault is BaseVault {

    event Deposited(address user, uint amount);
    event Withdrawn(address user, uint amount);

    function withdraw(uint amount) public override {
        require(amount >= 0.1 ether, "Minimum withdrawal is 0.1 ether");
        super.withdraw(amount);
        emit Withdrawn(msg.sender, amount);
    }

    function deposit(uint amount) public payable override {
        require(msg.value >= 0.01 ether, "Minimum deposit is 0.01 ether");
        super.deposit(amount);
        emit Deposited(msg.sender, amount);
    }
}
