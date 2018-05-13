pragma solidity ^0.4.18;

interface myInterface {
    function my_fun(uint amount) external pure returns (uint);
}

contract myContract is myInterface{
    uint internal var1 = 100;
    uint  var2 = 200;
    uint public var3 = 300;
    // uint external var4 = 400;
    function my_fun(uint amount) public pure returns (uint){
        return amount;
    }
    function my_fun(uint a, uint b) public pure returns (uint){
        return a + b;
    }
}

contract myContract2 is myContract {
    function call_my_fun() public pure returns (uint) {
        return my_fun(10,20);
        // return 5;
        // return my_fun(10);
    }
    function test_var1() public view returns (uint) {
        return var1;
    }
    function test_var2() public view returns (uint) {
    return var2;
    }
    function test_var3() public view returns (uint) {
    return var3;
    }
}

