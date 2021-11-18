// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Bank {
    
    mapping(address => uint) public balance;
    
    function deposit() public payable {
        balance[msg.sender] += msg.value;
    }
    
    function withdraw(uint amount) public {
        require(balance[msg.sender] >= amount);
        balance[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    function getMyBalance() public view returns(uint){
        return balance[msg.sender];
    }
    
    function getBankBalance() public view returns(uint){
        return address(this).balance;
    }
    
}
