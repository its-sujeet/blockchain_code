// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import "../src/test.sol";

contract Founder is Script{
    function run() external returns(ZombieFactory){
        vm.startBroadcast();
        ZombieFactory zombieFactory = new ZombieFactory();
        vm.stopBroadcast();
        return zombieFactory;
    }
}