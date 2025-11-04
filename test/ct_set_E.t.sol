// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Voting} from "../src/ct_set_E.sol";

contract CTSetETest is Test {
    Voting voting;
    string[] candidates;

    function setUp() public {
        candidates.push("Alice");
        candidates.push("Bob");
        candidates.push("Carol");
        voting = new Voting(candidates);
    }

    function testOneVotePerAddress() public {
        address voter = address(0xBEEF);
        vm.prank(voter);
        voting.vote(1);

        vm.prank(voter);
        vm.expectRevert();
        voting.vote(0);
    }

    function testWinnerIsCandidateWithMostVotes() public {
        vm.prank(address(0x1));
        voting.vote(0);

        vm.prank(address(0x2));
        voting.vote(1);
        vm.prank(address(0x3));
        voting.vote(1);

        vm.prank(address(0x4));
        voting.vote(2);

        (uint256 idx, string memory name) = voting.winner();
        assertEq(idx, 1);
        assertEq(name, "Bob");
    }
}
