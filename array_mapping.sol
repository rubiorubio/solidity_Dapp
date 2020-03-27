pragma solidity ^0.6.1;

contract TrustPersons {
    uint256 public peopleCount = 0;
    mapping(uint => Person) public people;

    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
        string _waletHash;
    }

    function addPerson(string memory _firstName, string memory _lastName, string memory _waletHash) public {
        peopleCount += 1;
        people[peopleCount] = Person(peopleCount, _firstName, _lastName, _waletHash);
    }
}

// the Same way but more expencive

// contract TrustPersons1 {
//     Person1[] public people1;
//     uint256 public peopleCount1 = 0;
//     struct Person1{
//         string _fName;
//         string _lName;
//     }
//     function addPerson1(string memory _fName, string memory _lName) public {
//         people1.push(Person1(_fName,_lName));
//         peopleCount1 +=1;
//     }
// }