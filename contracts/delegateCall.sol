// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

// NOTE: Deploy this contract first
contract A {
    uint public a;
    uint public b;
    address public DAI;
    address public USD;

    struct inputA {
        uint a;
        uint b;
        inputB params;
    }

    struct inputB {
        uint c;
        uint d;
    }

    mapping(address => inputA) public mapA;

}

contract B is A {

    function getNum() public view returns (uint) {
        return A.a;
    }

    function setA(uint _num) public returns (uint) {
        a = _num;
        return a;
    }

    function setB(uint _num) public returns (uint) {
        b = _num;
        return b;
    }

    function setDAI(address _address) public returns (address) {
        DAI = _address;
        return DAI;
    }

    function setUSD(address _address) public returns (address) {
        USD = _address;
        return USD;
    }

    function setMap(inputA memory _params) public returns (uint) {
        mapA[msg.sender].a = _params.a;
        mapA[msg.sender].b = _params.b;
        mapA[msg.sender].params.c = _params.params.c;
        mapA[msg.sender].params.d = _params.params.d;

        return 1e18;
    }
}

contract C is A {

    address public contractB;

    constructor (address _B) {
        contractB = _B;
    }

    function setA(uint _num) public returns (uint) {
        bytes memory data = abi.encodeWithSignature("setA(uint256)", _num);
        (bool success, bytes memory returnData) = contractB.delegatecall(data);
        require(success);
        return abi.decode(returnData, (uint));
    }

    function setB(uint _num) public returns (uint) {
        bytes memory data = abi.encodeWithSignature("setB(uint256)", _num);
        (bool success, bytes memory returnData) = contractB.delegatecall(data);
        require(success);
        return abi.decode(returnData, (uint));
    }

    function setDAI(address _address) public returns (uint) {
        bytes memory data = abi.encodeWithSignature("setDAI(address)", _address);
        (bool success, bytes memory returnData) = contractB.delegatecall(data);
        require(success);
        return abi.decode(returnData, (uint));
    }

    function setUSD(address _address) public returns (uint) {
        bytes memory data = abi.encodeWithSignature("setUSD(address)", _address);
        (bool success, bytes memory returnData) = contractB.delegatecall(data);
        require(success);
        return abi.decode(returnData, (uint));
    }

    function setMap(inputA memory _params) public returns (uint) {
        bytes memory data = abi.encodeWithSignature("setMap((uint256,uint256,(uint256,uint256)))", _params);

        (bool success, bytes memory returnData) = contractB.delegatecall(data);

        require(success);
        return abi.decode(returnData, (uint));
    }
}
