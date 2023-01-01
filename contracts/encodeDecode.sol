// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract Challenge{

    function a() public returns (bytes memory) {
        bool isTrue = true;
        uint value = 1;

        bytes memory params = abi.encode(isTrue, value);

        b(params);

        return params;
    }

    function b(bytes memory params) internal {
        bool isTrue;
        uint value;

        (isTrue, value) = abi.decode(params, (bool, uint));

        console.log(isTrue);
        console.logUint(value);
    }
}
