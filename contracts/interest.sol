pragma solidity >=0.7.0 <0.9.0;
/// @title interest
contract interest {

    uint public interest;
    uint public ContractBalance;
    uint public principal;

    function setInterest(uint val) public {
        interest = val;
    }


    // @dev 27650 gas

    function calculateInterest(uint principal, uint periods) public view returns (uint) {

        for(uint i;i<periods;i++) {
            principal += principal*interest;

        }
        return principal;

    }


    // @dev 26360 gas 
    function compound (uint principal, uint ratio, uint n) public pure returns (uint) {
        while (n > 0) {
            if (n % 2 == 1) {
            principal += principal * ratio;
            n -= 1;
            } else {
            ratio = 2 * ratio + ratio * ratio;
            n /= 2;
            }
        }  return principal;
    }


    function deposite () public payable {
        ContractBalance+=msg.value;
    }

}
 
