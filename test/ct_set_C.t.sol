// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {BlockRecorder} from "../src/ct_set_C.sol";

contract CTSetCTest is Test {
    BlockRecorder recorder;

    function setUp() public {
        recorder = new BlockRecorder();
    }

    function testRecord() public {
        recorder.record();

        (uint256 bn, uint256 ts) = getRecord(address(this));

        assertEq(bn, block.number);
        assertEq(ts, block.timestamp);
    }

    function testWarpTimestamp() public {
        uint256 future = block.timestamp + 1 days;
        vm.warp(future);

        recorder.record();

        (, uint256 ts) = getRecord(address(this));
        assertEq(ts, future);
    }

    function testRollChangesBlockNumber() public {
        uint256 futureBlock = block.number + 100;
        vm.roll(futureBlock);

        recorder.record();

        (uint256 bn, ) = getRecord(address(this));
        assertEq(bn, futureBlock);
    }

    function getRecord(address who) internal view returns (uint256, uint256) {
        (uint256 b, uint256 t) = recorder.records(who);
        return (b, t);
    }
}
