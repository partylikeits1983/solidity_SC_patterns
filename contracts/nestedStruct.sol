// SPDX-License-Identifier: MIT
pragma solidity =0.8.15;

contract Test {

    struct Params1 {
        uint a;
        Params2 parameters;
    }

    struct Params2 {
        uint b;
        uint c;
    }

    mapping(address => Params1) public map;

    // @dev input => ["0",["1","2"]]
    function createRequest(Params1 memory _params) public {
        Params1 storage newParams = map[msg.sender];
        newParams.a = _params.a;
        newParams.parameters.b = _params.parameters.b;
        newParams.parameters.c = _params.parameters.c;
        
    }

    function getVals() public view returns(uint,uint,uint) {
        Params1 memory vals = map[msg.sender];
        return (vals.a,vals.parameters.b,vals.parameters.c);
    } 
}

