// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.6.0;

contract ZombieFactory{
    uint public dnaDigits =16; // decared a variable with value 16
    uint public dnaModules = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function createZombie(string memory _name , uint _dna) public {
        
    }


    

    



}
 