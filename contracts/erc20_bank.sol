// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ERC20_Bank {

    mapping(address => mapping(address => uint)) public balances;


    // @notice
    // user must first approve this contract with specified amount inside the 
    // ERC20 token itself. This cannot be done inside this contract* (probably...)
    // This is handled on the front end
    // there is a uniswap function called safeApprove, however I haven't gotten it to work


    // Get allowance of token
   function GetAllowance(address token) public view returns(uint256){
       return IERC20(token).allowance(msg.sender, address(this));
   }
   
   // Get balance of ERC20 token in this contract
   function GetContractTokenBalance(address token) public view returns(uint){
       return IERC20(token).balanceOf(address(this));
   }


    // User deposits ERC20 into this contract
    function Deposit(address token, uint amount) external {

        require(amount > 0, "Cannot stake 0");
        balances[msg.sender][token] += amount;
        IERC20(token).transferFrom(msg.sender, address(this), amount);

    }

    // User withdraws ERC20 from this contract
    function Withdraw(address token, uint amount) external {
    
        require(balances[msg.sender][token] >= amount, "insufficient balance");
        balances[msg.sender][token] -= amount;
        IERC20(token).transfer(msg.sender, amount);

    }

}