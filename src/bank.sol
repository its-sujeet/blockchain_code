// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract  Bank {
    uint256 internal interestRate;
    string public constant bankName = "MyBank";
    address public owner;

    constructor(uint256 _interestRate) {
        owner = msg.sender;
        interestRate = _interestRate;
    }

    function getInterestRate() external view returns (uint256) {
        return interestRate;
    }
}