// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StoreManager {
    address private owner;
    constructor() {
        owner = msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    uint private storedValue;

    function store (uint value) external {
        storedValue = value;
    }

    function retrieve () external view onlyOwner returns  (uint) {
        return storedValue;
    }


}