// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract recordBlock {
    struct Block{
        uint blockNumber;
        uint timestamp;
    }
    mapping(address => Block) public userBlocks;

    function record(uint blockNum, uint time) external{
        userBlocks[msg.sender] = Block({
            blockNumber: blockNum,
            timestamp: time
        });
    }

}