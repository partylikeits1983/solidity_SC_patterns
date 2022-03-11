// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract DefintionHackathonPrizeMoney {

    //@dev address Owner => address token => uint balance of token
    mapping(address => mapping (address => uint)) public prizeMoney;

    //@dev address Owner => uint place => uint reward amount
    mapping(address => mapping(uint => uint)) public prizeAmounts;

    //@dev address Owner => uint place => address winner
    mapping(address => mapping (uint => address)) public winners;


    //@notice User deposits prize money into contract
    //@params address of ERC20 token, uint place, uint amount
    function depositPrizeMoney(address token, uint place, uint amount) external returns (uint) {
        require(amount > 0, "Cannot deposit 0 tokens");
        IERC20(token).transferFrom(msg.sender, address(this), amount);

        prizeMoney[msg.sender][token] += amount;
        prizeAmounts[msg.sender][place] += amount;

        return amount;
    }
  
  
    //@notice User updates winners
    //@params address winner, uint place
    function updateWinners(address winner, uint place) external returns (bool) {

        winners[msg.sender][place] = winner;
        
        return true;
    }


    //@notice winner address can withdraw winnings
    //@params address of owner, address of ERC20 token, uint place
    function withdrawPrizeMoney(address owner, address token, uint place) external returns (uint) {
        require(winners[owner][place] == msg.sender, "you didn't win anything :(");

        uint amount; 
        amount = prizeAmounts[owner][place];

        IERC20(token).transfer(msg.sender, amount);

        prizeMoney[owner][token] -= amount;
        prizeAmounts[msg.sender][place] -= amount;

        return amount;

    }


    //###### test functions ######


    // Get allowance of token
   function GetAllowance(address token) public view returns(uint256){
       return IERC20(token).allowance(msg.sender, address(this));
   }


    // Get balance of ERC20 token in this contract
   function GetContractTokenBalance(address token) public view returns(uint){
       return IERC20(token).balanceOf(address(this));
   }

}
