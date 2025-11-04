// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract BlockRecorder {
    struct Info {
        uint256 blockNumber;
        uint256 timestamp;
    }

    mapping(address => Info) public records;

    function record() external {
        records[msg.sender] = Info({blockNumber: block.number, timestamp: block.timestamp});
    }
}
