// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20; // defined the solidity version
 
contract OwnerShipDemo{
    address public owner;   // made a variable to store the owner address
    constructor(){
        owner = msg.sender;  // assigned owner as the address who deployed the contract and this is immutable
    }

    function getOwner() public view returns(address){   // created a funtion to return the address of owner
        return owner;       // returning the owner address
    }

     function onlyOwnerFunction() public view{      // created a function which can be called by only owner
        require(msg.sender == owner, "Not the owner");       // if msg.sender is not the owner then it will revert

        
        
    }


}