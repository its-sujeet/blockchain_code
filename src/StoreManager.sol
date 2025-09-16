// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StoreManager {
    address public caller;
    address public owner1;
    address constant ankit = address(0x2);
    address constant rahul = address(0x1);

    // constructor() {
    //     // owner = ankit;
    //     owner1= rahul;
    // }
    function setOwner() external {
        // owner = msg.sender;
        caller= msg.sender;
    }


    

    modifier onlyOwner() {
        require(msg.sender == owner1, "Not the owner");
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