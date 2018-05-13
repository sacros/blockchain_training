pragma solidity ^0.4.18;

contract Game {
    
    uint blockpass=0;
    mapping(address => uint) public amount;
    event YouAreTheWinner(uint amt);
    address gameAddress;
    
    constructor() public {
        gameAddress = msg.sender;
        setAmount(gameAddress, 1);
    }
    
    function setAmount(address addr, uint amt) public {
        amount[addr] = amt;
    }
    
    function playGame(uint amt) public {
        if (blockpass >= 3) {
            amount[msg.sender] += amount[gameAddress];
            amount[gameAddress] = 0;
            emit YouAreTheWinner(amount[msg.sender]);
        }
        else{
            amount[gameAddress] += amt;
            amount[msg.sender] -= amt;
            blockpass = 0;
        }
    }

    // function getAmount(address addr) public returns (uint) {
    //     return amount[addr];
    // }
    
    function blockPass() public {
        blockpass++;
    }

}