//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract MedialHistory {
    enum Gender {
        Male,
        Female
    }
    uint _patientCount = 0;

    struct Patient {
        string name;
        uint16 age;
        //max of uint16 is 4096
        //if we use uint8 the max is uint8
        string telephone;
        string homeAddress;
        uint64 birthday; //unix time
        string disease; //disease can be enum
        Gender gender;
    }
    mapping(uint => Patient) _PatientsData;

    function Register(
        string memory name,
        uint16 age,
        string memory telephone,
        string memory homeAddress,
        uint64 birthday,
        string memory disease,
        Gender gender
        ) external{
        _PatientsData[_patientCount ++] = Patient(name, age, telephone, homeAddress, birthday, disease, gender);
    }

    function Modify(
        uint id,
        string memory name,
        uint16 age,
        string memory telephone,
        string memory homeAddress,
        uint64 birthday,
        string memory disease,
        Gender gender
        ) external{
        _PatientsData[id] = Patient(name, age, telephone, homeAddress, birthday, disease, gender);
    }

    function getPatientData(uint id) external view returns(Patient memory){
        return _PatientsData[id];
    }
}
