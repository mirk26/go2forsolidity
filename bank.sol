pragma solidity ^0.5.0;

contract Bank {
	address public owner;
	uint balance;


	// Make the Constructor "payable"
	constructor() public payable {
	    owner = msg.sender;
	}
	
	function deposit() public payable returns(uint){
	    balance += msg.value;
	    return balance;
	}
    
    function withdraw(uint amount) public payable returns(uint remainingBal){
        if(balance>amount){
            balance -= amount;
            msg.sender.transfer(amount);
        }
        return balance;
    }
}
