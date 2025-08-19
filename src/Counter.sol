// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13; // pragma solidity >=0.8.13; // pragma solidity 0.8.13

contract Counter { // declaring contract
    uint256 public number; // Global variable initalized to zero // its a 256 bit integer which can be used as public state variable

    function setNumber(uint256 newNumber) public { // function to set the value of number
        number = newNumber; // at start the number was 0 now its  newNumber

    }

    function increment() public {
        number++;
    }

    function decrement() public {
        number--;
    }
}
