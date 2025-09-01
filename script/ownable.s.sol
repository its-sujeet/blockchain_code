// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";

import "../src/ownable.sol";

contract Founder is Script{
    function run() external returns(Ownable){
        vm.startBroadcast();
        Ownable ownable = new Ownable();
        vm.stopBroadcast();
        return ownable;
    }
}
