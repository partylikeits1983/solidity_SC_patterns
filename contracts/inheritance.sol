// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract A {

    mapping(address => uint) public balance;

    function add(uint val) public {

        balance[msg.sender] += val;

    }

}

contract B is A {

    function sub(uint val) public {

        balance[msg.sender] -= val;

    }

}
