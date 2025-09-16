// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {recordBlock} from "../src/block.sol";

contract BlockTest is Test {
    recordBlock rb;

    function setUp() public {
        rb = new recordBlock();
        }

    function testRecordBlock() public{
        rb.record(block.number, block.timestamp);
        (uint blockNum, uint time) = rb.userBlocks(address(this));
        assertEq(blockNum, block.number);
        assertEq(time, block.timestamp);
    }

    function testRecordBlockWithWarp() public{
        
        rb.record(block.number, block.timestamp);


        vm.warp(block.timestamp + 1000); 
        vm.roll(block.number + 10); 

        (uint blockNum, uint time) = rb.userBlocks(address(this));
        
        assertTrue(blockNum != block.number);
        assertTrue(time != block.timestamp);

       
    }

}
