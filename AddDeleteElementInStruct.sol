// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
/// @title Add & Delete Element In Struct

contract workingWithStructs {
    
    struct data {  
        address account;
        uint name;  
        uint nickname;  
    }
    
    mapping(address => data) public USER;
    
    address[] public users;

    
    function add(address user) public {
        // push user address to array
        users.push(user);
        
        //a dd random data to USER struct
        USER[msg.sender].account = msg.sender;
        USER[msg.sender].name = 1;
        USER[msg.sender].nickname = block.timestamp;
    }
    
    
    function remove(address user) public {
        // remove sinlge element from mapping 
        delete USER[user];
        
    }
    
    
    function removeAll() public {
        // since you can't delete an entire mapping in solidity
        // you can reset the struct address by address
        
        // for address in array users, delete element in USER
        for (uint i = 0; i < users.length; i++)
            
            // delete the element by user address
            delete USER[users[i]];
        
        // finally, delete the array
        delete users;
    }
}

