// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/StoreManager.sol";
import {console} from "forge-std/console.sol";

address constant rahul = address(0x1);
address constant ankit = address(0x2);
address constant rohan = address(0x3);
address constant vishal = address(0x4);
address constant amit = address(0x5);
address constant gaurav = address(0x6);

contract StoreManagerTest is Test {
    StoreManager storeManager;

    function setUp() public {
        storeManager = new StoreManager();
    }

    function testStore() public {
        console.log ("Owner address:", address(this));
        storeManager.store(42);
        uint val = storeManager.retrieve();
        assertEq(val, 42);
    }

    function testRetrieve() public {
        console.log ("Owner address:", address(this));
        storeManager.store(100);
        uint val = storeManager.retrieve();
        assertEq(val, 100);
    }
    function testForDifferentUsers() public{
        vm.startPrank(rahul);
        console.log ("Rahul address:", address(rahul));
        storeManager.store(42);
        vm.expectRevert("Not the owner");
        storeManager.retrieve();
        // assertEq(storeManager.retrieve(), 42);
        vm.stopPrank();

        vm.startPrank(ankit);
        console.log ("Ankit address:", address(ankit));
        storeManager.store(100);
        vm.expectRevert("Not the owner");
        storeManager.retrieve();
        // assertEq(storeManager.retrieve(), 100);
        vm.stopPrank();

        vm.startPrank(rohan);
        console.log ("Rohan address:", address(rohan));
        storeManager.store(200);
        vm.expectRevert("Not the owner");
        storeManager.retrieve();
        // assertEq(storeManager.retrieve(), 200);
        vm.stopPrank();

        vm.startPrank(vishal);
        console.log ("Vishal address:", address(vishal));
        storeManager.store(300);
        vm.expectRevert("Not the owner");
        storeManager.retrieve();
        // assertEq(storeManager.retrieve(), 300);
        vm.stopPrank();

        vm.startPrank(amit);
        console.log ("Amit address:", address(amit));
        storeManager.store(400);
        vm.expectRevert("Not the owner");
        storeManager.retrieve();
        // assertEq(storeManager.retrieve(), 400);
        vm.stopPrank();

        vm.startPrank(gaurav);
        console.log ("Gaurav address:", address(gaurav));
        storeManager.store(500);
        vm.expectRevert("Not the owner");
        storeManager.retrieve();
        // assertEq(storeManager.retrieve(), 500);
        vm.stopPrank();
    }

}
