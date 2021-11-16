pragma solidity ^0.4.2;

contract Bank{
    mapping(address=>uint) balances;
    
    function deposit() public payable{
        balances[msg.sender]+=msg.value;
    }
    function withdraw(uint amount) public{
        if(balances[msg.sender]>=amount){
            balances[msg.sender]-=amount;
            msg.sender.transfer(amount);
        }
    }
    function getMyBalance() public view returns(uint){
        return balances[msg.sender];
    }
    function getBankBalance() public view returns(uint){
        return address(this).balance;
    }
}
