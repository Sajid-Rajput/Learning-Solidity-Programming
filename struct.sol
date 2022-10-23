// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract solidityStruct{
    struct employee{
        string name;
        uint8 empid;
        address walletid;
    }

    employee public emp;
    employee[] public emps;

    constructor(string memory _name, uint8 _empid, address _walletid){
        emp.name = _name;
        emp.empid = _empid;
        emp.walletid = _walletid;
    }

    function addemployee() public {
        employee memory emp1 = employee("Sajid",26,0x617F2E2fD72FD9D5503197092aC168c91465E7f2);
        emp = emp1;

        employee memory emp2 = employee({empid: 99, name: "Yasir", walletid: msg.sender});
        emp = emp2;

        employee memory emp3;
        emp3.name = "Hassan";
        emp3.empid = 100;
        emp3.walletid = msg.sender;

        emp = emp3;

        emps.push(emp1);
        emps.push(emp2);
        emps.push(emp3);


        employee storage temp_memory = emp;
        // temp_memory.name = "Arshad";
        // temp_memory.empid = 234;
        // temp_memory.walletid = 0xdD870fA1b7C4700F2BD7f44238821C26f7392148;

        delete temp_memory.walletid;

        delete emps[2];
    
    }
}