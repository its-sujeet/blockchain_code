// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;
import {Script} from "forge-std/Script.sol";
import {OwnerUpOnly} from "../src/OwnerUpOnly.sol";

contract OwnerUpOnlyScript is Script {
  function run() external returns (OwnerUpOnly) {
    vm.startBroadcast();
    OwnerUpOnly ownerUpOnly = new OwnerUpOnly();
    vm.stopBroadcast();
    return ownerUpOnly;
  }


  

}


