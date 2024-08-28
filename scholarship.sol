// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CollegeScholarship {
    
    // Define a struct for a Student
    struct Student {
        uint id;
        string name;
        uint meritPoints;
        bool hasReceivedScholarship;
        address studentAddress;
    }

    // Define a struct for a Donor
    struct Donor {
        uint id;
        string name;
        address donorAddress;
    }

    // Mappings to store students and donors by their ID
    mapping(uint => Student) public students;
    mapping(uint => Donor) public donors;

    // Counter for the IDs
    uint public studentCount;
    uint public donorCount;

    // Events for adding students and donors, and for awarding scholarships
    event StudentAdded(uint id, string name, uint meritPoints, address studentAddress);
    event DonorAdded(uint id, string name, address donorAddress);
    event ScholarshipAwarded(uint studentId, uint amount, address donorAddress);

    // Function to add a new student
    function addStudent(string memory _name, uint _meritPoints, address _studentAddress) public {
        studentCount++;
        students[studentCount] = Student(studentCount, _name, _meritPoints, false, _studentAddress);
        emit StudentAdded(studentCount, _name, _meritPoints, _studentAddress);
    }

    // Function to add a new donor
    function addDonor(string memory _name, address _donorAddress) public {
        donorCount++;
        donors[donorCount] = Donor(donorCount, _name, _donorAddress);
        emit DonorAdded(donorCount, _name, _donorAddress);
    }

    // Function for a donor to donate funds and select a student to receive the scholarship
    function awardScholarship(uint _studentId) public payable {
        require(_studentId > 0 && _studentId <= studentCount, "Invalid student ID");
        Student storage student = students[_studentId];
        require(!student.hasReceivedScholarship, "Student has already received a scholarship");
        require(msg.value > 0, "Scholarship amount must be greater than zero");

        // Transfer the donation amount to the selected student's address
        payable(student.studentAddress).transfer(msg.value);

        // Mark the student as having received a scholarship
        student.hasReceivedScholarship = true;

        // Emit an event for the awarded scholarship
        emit ScholarshipAwarded(_studentId, msg.value, msg.sender);
    }

    // Function to get student details by ID
    function getStudent(uint _id) public view returns (uint, string memory, uint, bool, address) {
        Student memory student = students[_id];
        return (student.id, student.name, student.meritPoints, student.hasReceivedScholarship, student.studentAddress);
    }

    // Function to get donor details by ID
    function getDonor(uint _id) public view returns (uint, string memory, address) {
        Donor memory donor = donors[_id];
        return (donor.id, donor.name, donor.donorAddress);
    }
}
