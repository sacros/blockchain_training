pragma solidity ^0.4.20;

contract ERC20Interface {
    function totalSupply() public view returns (uint);
    function balanceOf(address tokenOwner) public view returns (uint balance);
    function transfer(address to, uint tokens) public returns (bool success);

    function allowance(address tokenOwner, address spender) public view returns (uint remaining);
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract Token is ERC20Interface {

    mapping(address => uint) public amount;
    mapping(address => mapping(address => uint)) public escrow;

    uint total = 10000;
    address contractAddress;

    constructor() public {
        contractAddress = msg.sender;
        amount[contractAddress] = total;
    }

    function totalSupply() public view returns (uint) {
        return total;
    }

    function transfer(address to, uint tokens) public returns (bool success) {
        if (amount[contractAddress] >= tokens) {
            emit Transfer(to, contractAddress, tokens);
            amount[to] += tokens;
            amount[contractAddress] -= tokens;
            return true;
        }
        else {
            return false;
        }
    }

    function balanceOf(address tokenOwner) public view returns (uint balance) {
        return amount[tokenOwner];
    }


    function approve(address spender, uint tokens) public returns (bool success) {
        escrow[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }

    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        return escrow[tokenOwner][spender];
    }

    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        if (escrow[from][msg.sender] >= tokens) {
            if (amount[from] >= tokens) {
                amount[from] -= tokens;
                amount[to] += tokens;
                escrow[from][msg.sender] -= tokens;
                emit Transfer(to, from, tokens);
                return true;
            }
        }
        return false;
    }

}