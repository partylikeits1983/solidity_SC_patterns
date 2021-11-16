// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
/// @title property listing and rental contract 
contract Logical_OR {

    uint256 public start = 1;
    uint256 public end = 2;

    bool public isTRUE;



    function doThis(uint256 t1, uint256 t2) public view returns (bool) {
        
        if (end <= t1 && start >= t2 == true) {

            isTRUE = true;

        }

        return isTRUE;

    }

}
