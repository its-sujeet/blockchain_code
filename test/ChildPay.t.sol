// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ChildPay} from "../src/ChildPay.sol";
import {Test,console} from "forge-std/Test.sol";
// import {console} from "forge-std/console.sol";

contract ChildPayTest is Test {
    ChildPay childPay;

    function setUp() public {
        childPay = new ChildPay();   // initialize ChildPay contract
    }

    function testlessThanMinimumDeposit() public {    // test for deposit less than minimum
        vm.deal(address(this), 1 ether);
        vm.expectRevert("Minimum deposit is 0.01 ether");
        childPay.deposit{value: 0.005 ether}();
    }

    function testDepositunique() public {  // test for valid deposit
        uint256 depositAmount = 0.02 ether;
        vm.deal(address(this), 1 ether);
        uint256 initialBalance = childPay.balances(address(this));
        console.log("Initial balance:", initialBalance);
        
        childPay.deposit{value: depositAmount}();
        uint256 contractBalance = childPay.balances(address(this));
        console.log("Contract balance after deposit:", contractBalance);
        assertEq(contractBalance, depositAmount + initialBalance, "balance should be equal to 0.02 ether");  //now done
    }

    function testEventEmittedOnDeposit() public {   // test for event emission
        uint256 depositAmount = 0.03 ether;
        vm.deal(address(this), 1 ether);
        // 
        vm.expectEmit(true, false, false, true);   
        // emit ChildPay.Deposited(address(this), depositAmount);     
        childPay.deposit{value: depositAmount}();
    }


    function testWithMultipleAccounts() public {
        uint256 depositAmount = 0.05 ether;
        address user1 = address(0x1);
        address user2 = address(0x2);
        
        vm.deal(user1, 1 ether);
        vm.deal(user2, 1 ether);
        
        vm.prank(user1);
        childPay.deposit{value: depositAmount}();
        
        vm.prank(user2);
        childPay.deposit{value: depositAmount}();

        assertEq(childPay.balances(address(user1)), depositAmount, "User1 balance should be 0.05 ether");
        assertEq(childPay.balances(address(user2)), depositAmount, "User2 balance should be 0.05 ether");
    }


}