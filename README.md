# College Scholarship Smart Contract - README


## Vision

The College Scholarship Smart Contract aims to create a transparent, secure, and decentralized system for awarding scholarships to deserving students based on their merit points. By leveraging blockchain technology, we ensure that scholarships are distributed fairly, donations are securely managed, and all transactions are publicly verifiable. This system allows donors to directly support students, fostering a more efficient and impactful educational funding ecosystem.

## Contract Overview

This smart contract is built using Solidity on the Ethereum blockchain. It manages the following key entities:
- **Students**: Individuals who are eligible to receive scholarships based on their merit points.
- **Donors**: Individuals or organizations that provide funds for scholarships.
- **Scholarships**: Funds donated by donors and awarded to students based on their merit.

### Key Features
- **Student Management**: Add students with their details (name, merit points, address) and track their scholarship status.
- **Donor Management**: Add donors with their details (name, address) to the system.
- **Scholarship Awarding**: Donors can directly award scholarships to students, with funds securely transferred to the student’s address.
- **Transparency**: All operations are recorded on the blockchain, ensuring transparency and traceability.

## Flowchart

```plaintext
+-----------------------+
|  Add Donor            |
|                       |
+----------+------------+
           |
           v
+-----------------------+
|  Add Student          |
|                       |
+----------+------------+
           |
           v
+-----------------------+
|  Award Scholarship    |
|  (Donor selects       |
|  Student)             |
+----------+------------+
           |
           v
+-----------------------+
|  Transfer Scholarship |
|  to Student Address   |
+-----------------------+
```

## Deployment

- **Contract Address**: 0x358AA13c52544ECCEF6B0ADD0f801012ADAD5eE3
  
To interact with the deployed contract, you can use tools like Remix, Truffle, or Web3.js, pointing to the provided contract address.

## Functions

### Add a New Student
```solidity
function addStudent(string memory _name, uint _meritPoints, address _studentAddress) public
```

### Add a New Donor
```solidity
function addDonor(string memory _name, address _donorAddress) public
```

### Award Scholarship to a Student
```solidity
function awardScholarship(uint _studentId) public payable
```

### Get Student Details by ID
```solidity
function getStudent(uint _id) public view returns (uint, string memory, uint, bool, address)
```

### Get Donor Details by ID
```solidity
function getDonor(uint _id) public view returns (uint, string memory, address)
```

## Future Scope

- **Multiple Scholarships**: Allow students to receive multiple scholarships over time.
- **Merit-Based Ranking**: Implement a ranking system to prioritize students based on their merit points.
- **Multi-Donor Support**: Enable multiple donors to contribute to a single scholarship for a student.
- **Cross-Chain Compatibility**: Expand the contract to support scholarships across different blockchains.
- **Governance Features**: Introduce voting mechanisms for donors to decide on scholarship distribution rules.

## Contact

For inquiries, support, or collaboration opportunities, please contact:

- Name:Kaberi Rabha
- Email:kaberirabha444@gmail.com
- GitHub:
