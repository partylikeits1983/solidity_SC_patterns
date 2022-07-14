//SPDX-License-Identifier: MIT
pragma solidity =0.8.15;


contract Contract {

    struct params1 {
        int a;
        int b;
        int c;
        int d;
    }

    struct params2 {
        int a;
        int b;
    }

    // JDMparams public JDMoption;

    function one(params1 memory _params) public pure returns (int,int) {

        int x = _params.a;
        int y = _params.b;

        int x1 = _params.c;
        int y1 = _params.d;

        params2 memory input;
        input.a = x1;
        input.b = y1;

        (x,y) = two(input);

        return (x,y);

    }

    function two(params2 memory _params) public pure returns (int,int) {
        int x = _params.a;
        int y = _params.b;

        x += 1;
        y += 1;

        return (x,y);
    }

}
