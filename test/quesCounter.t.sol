// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.20;
import {Counter} from  "../src/quesCounter.sol";
import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";

contract CounterTest is Test {
    Counter counter;

    function setUp() public {
        counter = new Counter();  // here we are deploying the contract
    }

   

    function testOwner() public view {
        address owner = counter.owner();
        console.log("Owner address:", owner);
        console.log("Test contract address:", address(this));
        assertEq(owner, address(this), "Owner should be the deployer");  // here we are checking the owner  the deployer is the owner
    }

    function testOnlyOwnerModifier() public {  // here we are testing the modifier we used that it is only accessible by the owner 
        // Simulate a call from a different address
        vm.prank(address(0x123));
        vm.expectRevert("Not the owner");
        counter.increment();
    }

     function testInitialCount() public view {
        uint256 initialCount = counter.viewCount();
        assertEq(initialCount, 0, "Initial count should be 0");  // here we aree testing that in constructor we have set the count to zero 
    }

     function testAddNumbers() public view {
        uint256 sum = counter.addNumbers(3, 7);
        assertEq(sum, 10, "should be equal 10");   // here we are testing the addNumbers function
    }

    function testIncrement() public {
        counter.increment();
        uint256 countAfterIncrement = counter.viewCount();
        assertEq(countAfterIncrement, 1, "Count should be 1 after one increment");
    }

    


   




}