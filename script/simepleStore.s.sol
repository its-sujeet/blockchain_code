// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";

import "../src/simpleStore.sol";

contract Founder is Script{
    function run() external returns(simpleStore){
        vm.startBroadcast();
        simpleStore simplestore = new simpleStore();
        vm.stopBroadcast();
        return simplestore;
    }
}
