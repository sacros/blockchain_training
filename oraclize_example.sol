pragma solidity ^0.4.18;
import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

contract Game is usingOraclize{
    
    mapping(address => uint) public amount;
    event YouAreTheWinner(uint amt);
    event callbackResult(uint number);
    address gameAddress;
    
    bool public nextWinner;
    bytes32 public oraclizeID;
    bytes32 public oraclizeIDGet;

    function generateChance() public payable {
        oraclizeID = oraclize_query("WolframAlpha", "random number between 1 and 100");
    }

    function __callback(bytes32 _oraclizeId, uint number) public {
        if(msg.sender != oraclize_cbAddress()) revert();
        oraclizeIDGet = _oraclizeId;
        callbackResult(number);
        if(number <= 99) { //generates a 33% chance of the next player being the winner
            nextWinner = true;
        }
    }

    function Game() public {
        gameAddress = msg.sender;
        setAmount(gameAddress, 1);
        nextWinner = false;
    }
    
    function setAmount(address addr, uint amt) public {
        amount[addr] = amt;
    }
    
    function playGame(uint amt) public {
        if (nextWinner == true) {
            amount[msg.sender] += amount[gameAddress];
            amount[gameAddress] = 0;
            YouAreTheWinner(amount[msg.sender]);
            nextWinner = false;
        }
        else{
            amount[gameAddress] += amt;
            amount[msg.sender] -= amt;
        }
    }
    
    function blockPass() public {
        //blockpass++;
        generateChance();
    }

}