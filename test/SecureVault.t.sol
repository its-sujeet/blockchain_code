// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {SecureVault} from "../src/SecureVault.sol";
import "forge-std/Test.sol";

contract SecureVaultTest is Test{

    SecureVault public secureVault;

    address constant alice = address(0xABCD);
    address constant bob = address(0xEF01);
    address constant charlie = address(0x1234);


    function setUp() public {
        secureVault = new SecureVault();
    }

    event Withdrawn(address user, uint amount);

    function testDeposit() public {
        vm.deal(alice, 5 ether);
        vm.startPrank(alice);
        secureVault.deposit{value: 5 ether}(5 ether);
        vm.stopPrank();
        assertEq(secureVault.getBalance(alice), 5 ether);

        vm.deal(bob, 3 ether);
        vm.startPrank(bob);
        secureVault.deposit{value: 3 ether}(3 ether);
        vm.stopPrank();
        assertEq(secureVault.getBalance(bob), 3 ether);

        vm.deal(charlie, 2 ether);
        vm.startPrank(charlie);
        secureVault.deposit{value: 2 ether}(2 ether);
        vm.stopPrank();
        assertEq(secureVault.getBalance(charlie), 2 ether);
    }


    function testWithdrawbelowMinimum() public {
       vm.deal(alice, 1 ether);
        vm.startPrank(alice);
        secureVault.deposit{value: 1 ether}(1 ether);
        vm.expectRevert("Minimum withdrawal is 0.1 ether");
        secureVault.withdraw(0.05 ether);
        vm.stopPrank();
        assertEq(secureVault.getBalance(alice), 1 ether);
    }

    function testwithdraw() public {
        vm.deal(bob, 2 ether);
        vm.startPrank(bob);
        secureVault.deposit{value: 2 ether}(2 ether);
    vm.expectEmit(true, false, false, true);
    emit Withdrawn(bob, 0.5 ether);
        secureVault.withdraw(0.5 ether);
        vm.stopPrank();
        assertEq(secureVault.getBalance(bob), 1.5 ether);
    }
}