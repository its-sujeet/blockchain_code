// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";

import "../src/dataStore.sol";

contract Founder is Script{
    function run() external returns(DataStore){
        vm.startBroadcast();
        DataStore datastore = new DataStore();
        vm.stopBroadcast();
        return datastore;
    }
}
