pragma solidity ^0.6.1;

contract TrustPersons {
    uint256 public peopleCount = 0;
    mapping(uint => Person) public people;

    address owner;

    uint256 OpeningTime = 1584021299; // Время в секундах, которе https://www.epochconverter.com/

    modifier onlyWhileOpen() {
        require(block.timestamp >= OpeningTime);
        _;
    }

    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
        string _waletHash;
    }

    function addPerson (string memory _firstName, string memory _lastName, string memory _waletHash) public onlyWhileOpen {
        peopleCount += 1;
        people[peopleCount] = Person(peopleCount, _firstName, _lastName, _waletHash);
    }
}