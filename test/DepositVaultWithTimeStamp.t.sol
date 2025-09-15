// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import {Test} from "forge-std/Test.sol";
import {DepositVaultWithTimeStamp} from "../src/DepositVaultWithTimeStamp.sol";


contract DepositVaultWithTimeStampTest is Test {
    DepositVaultWithTimeStamp public depositVaultWithTimeStamp;

    address constant rahul = address(0xADC);
    address constant test1 = address(0xABCD);
    address constant test2 = address(0xABCDE);
    address constant test3 = address(0xABCDEF);
    function setUp() public {
        depositVaultWithTimeStamp = new DepositVaultWithTimeStamp();
    }

    function testDeposit() public {
        vm.deal(rahul, 10 ether);
        vm.deal(test1, 1 ether);
        vm.deal(test2, 2 ether);
        vm.deal(test3, 3 ether);

        vm.startPrank(rahul);
        depositVaultWithTimeStamp.deposit{value: 10 ether}();
        vm.stopPrank();

        vm.startPrank(test1);
        depositVaultWithTimeStamp.deposit{value: 1 ether}();
        vm.stopPrank();

        vm.startPrank(test2);
        depositVaultWithTimeStamp.deposit{value: 2 ether}();
        vm.stopPrank();

        vm.startPrank(test3);
        depositVaultWithTimeStamp.deposit{value: 3 ether}();
        vm.stopPrank();

        (uint amount, uint time) = depositVaultWithTimeStamp.getTransactionDetails(rahul);
        assertEq(amount, 10 ether);
        assertEq(time, block.timestamp);

        (amount, time) = depositVaultWithTimeStamp.getTransactionDetails(test1);
        assertEq(amount, 1 ether);
        assertEq(time, block.timestamp);

        (amount, time) = depositVaultWithTimeStamp.getTransactionDetails(test2);
        assertEq(amount, 2 ether);
        assertEq(time, block.timestamp);
        (amount, time) = depositVaultWithTimeStamp.getTransactionDetails(test3);
        assertEq(amount, 3 ether);
        assertEq(time, block.timestamp);
    }

    function testGetBalance() public {
        vm.deal(rahul, 1 ether);
        vm.deal(test1, 1 ether);
        vm.deal(test2, 2 ether);
        vm.deal(test3, 3 ether);

        vm.startPrank(rahul);
        depositVaultWithTimeStamp.deposit{value: 1 ether}();
        vm.stopPrank();

        vm.startPrank(test1);
        depositVaultWithTimeStamp.deposit{value: 1 ether}();
        vm.stopPrank();
        vm.startPrank(test2);
        depositVaultWithTimeStamp.deposit{value: 2 ether}();
        vm.stopPrank();
        vm.startPrank(test3);
        depositVaultWithTimeStamp.deposit{value: 3 ether}();
        vm.stopPrank();

        (uint balance, uint depositTime) = depositVaultWithTimeStamp.getTransactionDetails(rahul);
        assertEq(balance, 1 ether);
        

        (balance, depositTime) = depositVaultWithTimeStamp.getTransactionDetails(test1);
        assertEq(balance, 1 ether);
        

        (balance, depositTime) = depositVaultWithTimeStamp.getTransactionDetails(test2);
        assertEq(balance, 2 ether);
        
        (balance, depositTime) = depositVaultWithTimeStamp.getTransactionDetails(test3);
        assertEq(balance, 3 ether);
        

    }

    function testGetDepositTime() public {
        vm.deal(rahul, 1 ether);
        vm.deal(test1, 1 ether);
        vm.deal(test2, 2 ether);
        vm.deal(test3, 3 ether);

        vm.startPrank(rahul);
        depositVaultWithTimeStamp.deposit{value: 1 ether}();
        vm.stopPrank();
        vm.warp(block.timestamp + 100); 
        (uint balance, uint depositTime) = depositVaultWithTimeStamp.getTransactionDetails(rahul);
        assertEq(balance, 1 ether);
        assertEq(depositTime, block.timestamp - 100);
        assertEq(depositTime, block.timestamp - 100);

        vm.startPrank(test1);
        depositVaultWithTimeStamp.deposit{value: 1 ether}();
        vm.stopPrank();
        vm.warp(block.timestamp + 200);
        (balance, depositTime) = depositVaultWithTimeStamp.getTransactionDetails(test1);
        assertEq(balance, 1 ether);
        assertEq(depositTime, block.timestamp - 200);

        vm.startPrank(test2);
        depositVaultWithTimeStamp.deposit{value: 2 ether}();
        vm.stopPrank();
        vm.warp(block.timestamp + 300);
        (balance, depositTime) = depositVaultWithTimeStamp.getTransactionDetails(test2);
        assertEq(balance, 2 ether);
        assertEq(depositTime, block.timestamp - 300);
        
        vm.startPrank(test3);
        depositVaultWithTimeStamp.deposit{value: 3 ether}();
        vm.stopPrank();
        vm.warp(block.timestamp + 400);
        (balance, depositTime) = depositVaultWithTimeStamp.getTransactionDetails(test3);
        assertEq(balance, 3 ether);
        assertEq(depositTime, block.timestamp - 400);

        




    }

}