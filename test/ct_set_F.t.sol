// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {DepositLedger} from "../src/ct_set_F.sol";

contract CTSetFTest is Test {
    DepositLedger ledger;
    address deployer;
    address alice = address(0xA);

    function setUp() public {
        ledger = new DepositLedger();
        deployer = address(this);
    }

    function testDepositBalance() public {
        vm.deal(alice, 1 ether);
        vm.prank(alice);
        ledger.deposit{value: 0.6 ether}();

        uint256 b = ledger.getBalance(alice);
        assertEq(b, 0.6 ether);
    }

    function testOwnerIsDeployerAndCaller() public {
        assertEq(ledger.owner(), deployer);

        vm.deal(address(0xB), 2 ether);
        vm.prank(address(0xB));
        ledger.deposit{value: 1 ether}();

        uint256 ownerBal = ledger.getBalance(deployer);
        assertEq(ownerBal, 0);

        uint256 callerBal = ledger.getBalance(address(0xB));
        assertEq(callerBal, 1 ether);
    }
}
