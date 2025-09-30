

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract Voting{

    struct candidate{
        string name;
        uint votes;
    }

    candidate [] public  candidates;
    mapping(address => bool) public hasVoted;

    function addCandidate(string memory _name) public {
        candidates.push(candidate(_name, 0));
    }

    function vote_using_index (uint _index ) public {
        require(_index < candidates.length, "Invalid Candidate");
        require(!hasVoted[msg.sender], "Already Voted");
        candidates[_index].votes++;
        hasVoted[msg.sender] = true;
    }

    function getWinner() public view returns (string memory winnerName, uint winnerVotes){
        uint256 winnerIndex = 0;
        uint256 highestScore =0;

        for(uint256 i =0; i< candidates.length; i++){
            if(candidates[i].votes > highestScore){
                highestScore= candidates[i].votes;
                winnerIndex = i;
            }

            }

        return (candidates[winnerIndex].name, candidates[winnerIndex].votes);
    }




    
    
}



