// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract simpleStore{
    uint256 public favNum;
    struct Person{
        string name;
        uint256 favNum;

    }

    function store( uint256 _favNum) public {
        favNum= _favNum;
    }

    function retrive() public  view returns  (uint256){
        return favNum;
    }

    // Person public  p1 = Person("harshit", 10);
    // Person public  p2 = Person("sahil",20);

    Person[] public  persons;

    mapping (uint => string) public numToName;

    function addPerson(string memory _name, uint _num) public {
        persons.push(Person(_name,_num));
        numToName[_num] = _name;

    }

    function getPerson(uint _index) public view returns (string memory, uint) {
        Person memory p = persons[_index];
        return (p.name, p.favNum);
    }

}