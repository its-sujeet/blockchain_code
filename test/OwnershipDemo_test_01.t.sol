// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20; // Defined the solidity version

import {Test} from "forge-std/Test.sol";   // imported the test liabrary from forge-std
import {OwnerShipDemo} from "../src/OwnerShipDemo_test_01.sol";  // importe our own contract that we wrote

contract OwnershipDemoTest is Test {      // created a contract for testing and inherited the Test liabrary
    OwnerShipDemo demo;     // created a variable of type OwnerShipDemo


    address alice = address(0xABCD);  // created a dummy address to test the only owner function

    function setUp() public {  // created a setup function to deploy the contract
        demo = new OwnerShipDemo();   // created a new instance of the contract
    }

   

    function testGetOwner() public view {     // writing a test function to test the getOwner function
        address owner = demo.getOwner();      // getting the owner address from the contract
        assertEq(owner, address(this));       // cheacking whether the owner is the address that deployed the contract or not
    }


    function testOnlyOwner() public view {     // writing a test function to test the onlyOwnerFunction
        demo.onlyOwnerFunction();              // calling the onlyOwnerFunction from the contract and it didn't revert because the msg.sender is the owner
    }


    function testOnlyOwnerPrank() public {       // creating a test function to test the onlyOwnerFunction with alice address
        vm.startPrank(alice);                    // setting the msg.sender to alice address
        vm.expectRevert();                       // expecting the next line to revert because alice is not the owner so that the test will pass
        demo.onlyOwnerFunction();                // calling the onlyOwnerfunction from the contract with alice address and it will revert
        vm.stopPrank();                          // stopping the prank
    }




}