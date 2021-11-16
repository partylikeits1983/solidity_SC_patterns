// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
/// @title property listing and rental contract
contract mapTest {

    struct map1 {

        uint256 val1;
        uint256 val2;

    }

    struct map2 {

        uint256 val1;
        uint256 val2;

    }


    mapping(address => mapping (uint256 => map1)) public structure1;



    function setVal(uint256 val1, uint256 val2) public {

        structure1[msg.sender][0].val1 = val1;
        structure1[msg.sender][0].val2 = val2;

    }
}
