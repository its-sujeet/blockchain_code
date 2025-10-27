// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Bank} from "../src/bank.sol";
import {Test} from "forge-std/Test.sol";

contract BankTest is Test {
    Bank bank;

    function setUp() public {
        bank = new Bank(5);
    }

    function testInitialInterestRate() view public {
        uint256 rate = bank.getInterestRate();
        assertEq(rate, 5, "Initial interest rate should be 5");
    }

    function testBankName() view public {
        string memory name = bank.bankName();
        assertEq(name, "MyBank", "Bank name should be MyBank");
    }

    function testOwner() view public {
        address owner = bank.owner();
        assertEq(owner, address(this), "Owner should be the deployer");
    }

    function testAccessInterestRate() public view {
        // bank.interestRate();
        // This line should cause a compilation error because interestRate is internal
    }
}