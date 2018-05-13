pragma solidity ^0.4.18;

contract Dapp{

    address owner;
    mapping(address => Person) public personInfo;

    constructor() public{
        owner = msg.sender;
    }
    
    struct Person {
        bytes name;
        uint age;
        bool is_admin;
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

}