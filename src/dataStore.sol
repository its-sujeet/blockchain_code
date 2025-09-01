// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Ownable} from "./ownable.sol";

contract DataStore is Ownable{
    mapping (address => uint256 []) addressToNum;

    function store(uint256 [] calldata _num ) public {
        // require(msg.sender == owner, "You are not the contract owner");
        addressToNum[msg.sender] = _num;
    }

    function read() public view returns (uint256 [] memory) {
        return addressToNum[msg.sender];
    }


}