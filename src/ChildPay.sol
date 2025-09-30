// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./BasePay.sol";


event Deposited(address user,uint amount);

contract ChildPay is BasePay {
    function deposit() public payable override {
        require(msg.value >= 0.01 ether, "Minimum deposit is 0.01 ether");
        super.deposit();
        emit Deposited(msg.sender, msg.value);
    }
}
