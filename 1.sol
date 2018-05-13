pragma solidity ^0.4.18;

//single line comment

/*
    multiple line
    comment
*/


contract Test1{

    uint counter;
    address owner;
    Person[] persons;
    uint[2][2] multiD;
    mapping(address => Person) public personInfo;

    constructor() public{
        counter=0;
        owner = msg.sender;
    }

    modifier counter_limit {
        require(counter < 5);
        _;
    }

    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }
    
    event FunctionCalled(address sender, uint value);

    struct Person {
        bytes name;
        uint age;
        bool is_admin;
    }

    enum State {Unregisterd, Active, Inactive}

    function my_fun(uint var1) counter_limit onlyOwner public returns (uint){
        counter++;
        emit FunctionCalled(msg.sender, var1);
        return var1;
    }

    function get_counter() onlyOwner public view returns (uint){
        return counter;
    }
    
    function addPerson(bytes name, uint age, bool is_admin) public {
        Person memory p;
        p.name = name;
        p.age = age;
        p.is_admin = is_admin;
        persons.push(p);
        counter++;
    }
    
    function getPerson() public view returns (bytes, uint, bool) {
        return (persons[0].name, persons[0].age, persons[0].is_admin);
    }
    
    function setMultiD() public {
        multiD = [[1,2], [3,4]];
    }

    function getMultiD() public view returns (uint, uint, uint, uint){
        return (multiD[0][0], multiD[0][1], multiD[1][0], multiD[1][1]);
    }

    function addPersonInfo(bytes name, uint age, bool is_admin) public {
        Person memory p;
        p.name = name;
        p.age = age;
        p.is_admin = is_admin;
        personInfo[msg.sender] = p;
    }
    
    function getPersonInfo(address addr) view public returns (bytes, uint, bool) {
        return (personInfo[addr].name, personInfo[addr].age, personInfo[addr].is_admin);
    }
    
    function deleteTest(uint value) public returns (uint) {
        uint v = value;
        // delete v; 
        // ^ assigns 0 to value
        return v;
        // uint[] a = {1,2,3};
        // return a[0];
    }
    
    function getNow() public view returns (uint, address, uint, uint, uint) {
        return (now, block.coinbase, block.blockhash, block.gasLimit, block.number);
    }
    
    
    
    
}