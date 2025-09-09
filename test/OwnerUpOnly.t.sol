// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;
import {Test} from "forge-std/Test.sol";

import "forge-std/console.sol";

import {OwnerUpOnly} from "../src/OwnerUpOnly.sol";


address constant alice = address(0xABCD);



contract OwnerUpOnlyTest is Test {
  OwnerUpOnly public ownerUpOnly;

  function setUp() public {
    ownerUpOnly = new OwnerUpOnly();
  }

    function test_IncrementOwnerOnly() public{
        ownerUpOnly.increment();
        assertEq(ownerUpOnly.count(),1);
    }

    function test_Prank() public{  
        vm.expectRevert(); // expect the testcase should fail so it will so pass as this shoudld fail
        vm.prank(address(0)); // only the next line is set to address(0)
        ownerUpOnly.increment();
        ownerUpOnly.increment();

        assertEq(ownerUpOnly.count(),1);
    }

    function test_StartPrank() public{
         // expect the testcase should fail so it will so pass as this shoudld fail 
        vm.startPrank(address(0)); // all the lines below are set to address(0) until vm.stopPrank() is called
        vm.expectRevert();
        ownerUpOnly.increment();
        vm.expectRevert();
        ownerUpOnly.increment();
        vm.stopPrank();
        assertEq(ownerUpOnly.count(),0);
    }

    function test_Warp() public{
      vm.warp(100);
      assertEq(block.timestamp,100);
      console.log("Time is now",block.timestamp);
      console.log("Sender is now",msg.sender);
      console.log("Owner is",ownerUpOnly.owner());

    }

    function test_roll() public{
      vm.roll(100);
      assertEq(block.number,100);
    }

    function test_fee() public{  // diff btwn vm.fee and vm.txGasPrice is vm.fee is block fee and vm.txGasPrice is transaction gas price(vm.fee is for block)
      vm.fee(25 gwei);
      assertEq(block.basefee,25 gwei);
    }

    function test_deal() public{
      console.log("Balance of alice before deal",alice.balance);
      vm.deal(alice,100 ether);

      assertEq(alice.balance,100 ether);
    }

    function test_broadcast() public{    // not clear about this how can we test whether the broadcast is started
      vm.broadcast(address(alice));
      vm.expectRevert();
      ownerUpOnly.increment();
      // assertEq(msg.sender,address(alice));

    }

    


    function test_Startbroadcast() public{ // not clear about this how can we test whether the broadcast is started
      vm.startBroadcast();
      vm.expectRevert();
      ownerUpOnly.increment();
      vm.stopBroadcast();
    }


    

    function test_txGasPrice() public{
      vm.txGasPrice(1 gwei);
      assertEq(tx.gasprice,1 gwei);
    }


    


}

