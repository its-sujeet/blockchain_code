// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;
import {Test} from "forge-std/Test.sol";

import {OwnerUpOnly} from "../src/OwnerUpOnly.sol";

contract OwnerUpOnlyTest is Test {
  OwnerUpOnly public ownerUpOnly;

  function setUp() public {
    ownerUpOnly = new OwnerUpOnly();
  }

    function test_IncrementOwnerOnly() public{
        ownerUpOnly.increment();
        assertEq(ownerUpOnly.count(),1);
    }

    function test_Increment() public{
        vm.expectRevert(); // expect the testcase should fail so it will so pass as this shoudld fail
        vm.prank(address(0)); // only the next line is set to address(0)
        ownerUpOnly.increment();
        ownerUpOnly.increment();

        assertEq(ownerUpOnly.count(),1);
    }

    function test_Increment_2() public{
         // expect the testcase should fail so it will so pass as this shoudld fail 
        vm.startPrank(address(0)); // all the lines below are set to address(0) until vm.stopPrank() is called
        vm.expectRevert();
        ownerUpOnly.increment();
        vm.expectRevert();
        ownerUpOnly.increment();
        vm.stopPrank();
        assertEq(ownerUpOnly.count(),0);
    }


}

