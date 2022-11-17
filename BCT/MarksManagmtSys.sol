// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract MarksManagmtSys
{
    // Create a structure for 
    // student details
    struct Student
    {
        int ID;
        string fName;
        string lName;
        int marks;
    }
  
    address owner;
    int public stdCount = 0;
    mapping(int => Student) public stdRecords;
  
    modifier onlyOwner
    {
        require(owner == msg.sender);
        _;
    }
    constructor()
    {
        owner=msg.sender;
    }
  
    function updateMarks(int _ID, int new_marks) public payable onlyOwner
    {
        require(stdRecords[_ID].ID > 0, 'Entry not present');
        stdRecords[_ID].marks = new_marks;
    }

    function addNewRecords(int _ID, string memory _fName,string memory _lName,int _marks) public payable onlyOwner
    {
        stdCount = stdCount + 1;
        stdRecords[_ID] = Student(_ID, _fName, _lName, _marks);
    }

    function deleteRecord(int _ID)public payable onlyOwner
    {
        delete stdRecords[_ID];
        stdCount = stdCount - 1;
    }


  
}
