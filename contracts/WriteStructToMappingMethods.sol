// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract StructTest {

    struct StructA {
        address tokenA;
        address tokenB;
        uint tokenA_balance;
        uint tokenB_balance;
        bool isBool;
        StructB structB;
    }

    struct StructB {
        uint a;
        uint b;
        uint c;
    }

    mapping(address => mapping(address => mapping(uint => StructA))) public MappingA;

    // 202193 gas
    function write_mapping(address pair, address user, uint ID, StructA memory _structA) public {
        MappingA[pair][user][ID] = _structA;
    }

    // 202234 gas
    function write_mapping2(address pair, address user, uint ID, StructA memory _structA) public {
        MappingA[pair][user][ID].tokenA = _structA.tokenA;
        MappingA[pair][user][ID].tokenB = _structA.tokenB;
        MappingA[pair][user][ID].tokenA_balance = _structA.tokenA_balance;
        MappingA[pair][user][ID].tokenB_balance = _structA.tokenB_balance;
        MappingA[pair][user][ID].isBool = _structA.isBool;
        
        MappingA[pair][user][ID].structB.a = _structA.structB.a;
        MappingA[pair][user][ID].structB.b = _structA.structB.a;
        MappingA[pair][user][ID].structB.c = _structA.structB.a;
    }
}
