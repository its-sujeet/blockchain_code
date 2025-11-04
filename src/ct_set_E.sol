// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    string[] public candidates;
    mapping(uint256 => uint256) public votes; 
    mapping(address => bool) public hasVoted;


    constructor(string[] memory _candidates) {
        require(_candidates.length > 0, "No candidates");
        for (uint i = 0; i < _candidates.length; i++) {
            candidates.push(_candidates[i]);
        }
    }

    function vote(uint256 candidate) external {
        require(!hasVoted[msg.sender], "Already voted");
        require(candidate < candidates.length, "Invalid candidate");
        votes[candidate] += 1;
        hasVoted[msg.sender] = true;
    }

    function winner() external view returns (uint256 winningIndex, string memory winningName) {
        uint256 highest = 0;
        uint256 idx = 0;
        for (uint i = 0; i < candidates.length; i++) {
            if (votes[i] > highest) {
                highest = votes[i];
                idx = i;
            }
        }
        return (idx, candidates[idx]);
    }
}
