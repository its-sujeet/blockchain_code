// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../src/ct_set_A.sol";
import {Test} from "forge-std/Test.sol";

contract CTSetATest is Test {
    PayableDemo payableDemo;

    // Use a non-precompile address so ETH transfers to this address succeed in tests
    address constant user1 = address(0x100);


    function setUp() public {
        payableDemo = new PayableDemo();
    }

    function testDeposit() public {
        payableDemo.deposit{value: 1 ether}();
        uint balance = payableDemo.balances(address(this));
        assertEq(balance, 1 ether);
        vm.deal(user1, 2 ether);
        vm.prank(user1);
        payableDemo.deposit{value: 0.5 ether}();
        uint user1Balance = payableDemo.balances(user1);
        assertEq(user1Balance, 0.5 ether);

    }

    function testWithdraw() public {
        payableDemo.deposit{value: 1 ether}();
        payableDemo.withdraw(0.5 ether);
        uint balance = payableDemo.balances(address(this));
        assertEq(balance, 0.5 ether);
        vm.deal(user1, 2 ether);
        vm.prank(user1);
        payableDemo.deposit{value: 1 ether}();
        vm.prank(user1);
        payableDemo.withdraw(0.3 ether);
        uint user1Balance = payableDemo.balances(user1);
        assertEq(user1Balance, 0.7 ether);
    }

    

       receive() external payable {}

}
