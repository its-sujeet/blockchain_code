// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract Counter {
    uint256 public count;
    address public owner;
    constructor() {
        owner = msg.sender;
        count = 0;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
        
    }

    function increment() external onlyOwner {
        count += 1;
    }


    function viewCount() external view returns (uint256) {
        return count;
    }

    function addNumbers(uint256 a, uint256 b) external pure returns (uint256) {
        return a + b;
    }

    //this is the contract that we wrote previously


}