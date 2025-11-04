// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {StorageManager} from "../src/ct_set_D.sol";

contract CTSetDTest is Test {
    StorageManager sm;
    address alice = address(0xA11CE);

    function setUp() public {
        sm = new StorageManager();
    }

    function testStoreAndRetrieve() public {
        sm.store(42);
        uint256 v = sm.retrieve();
        assertEq(v, 42);
    }

    function testPrankSimulatesDifferentUser() public {
        vm.prank(alice);
        sm.store(1234);

        uint256 v = sm.retrieve();
        assertEq(v, 1234);
    }
}
