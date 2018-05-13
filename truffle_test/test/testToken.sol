pragma solidity ^0.4.20;
import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Token.sol";

contract testToken {
    function testTotalSupply() public{
        Token TokenContract = Token(DeployedAddresses.Token());
        uint expected = 1000;
        Assert.equal(TokenContract.totalSupply(), expected, "Contract should have 10000 tokens initially ");
    }
}