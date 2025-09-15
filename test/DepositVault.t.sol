// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {DepositVault} from "../src/DepositVault.sol";

contract DepositVaultTest is Test {
    DepositVault public depositVault;

    address constant rahul = address(0xADC);
    function setUp() public {
        depositVault = new DepositVault();
    }

    function testDeposit() public {
        vm.deal(rahul, 10 ether);
        vm.startPrank(rahul);
        depositVault.deposit{value: 10 ether}();
        vm.stopPrank();
        assertEq(depositVault.balances(rahul), 10 ether);
    }

    function testGetBalance() public {
        vm.deal(rahul, 1 ether);
        vm.startPrank(rahul);
        depositVault.deposit{value: 1 ether}();
        vm.stopPrank();
        uint balance = depositVault.getBalance(rahul);
        assertEq(balance, 1 ether);
    }
}
