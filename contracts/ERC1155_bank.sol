// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract LiquidityFactory is ERC1155 {

    // @notice this smart contract allows users to deposit ERC20 tokens and recieve a staked/wrapped version of the ERC20
    // token that they deposited in return. This contract is compatible with all ERC20 tokens.

    // https://docs.openzeppelin.com/contracts/3.x/api/token/erc1155

    // @dev the URI for the ERC1155 contract 
    constructor() public ERC1155("https://deltadex.io/{id}.json") {}


    // @dev probably the best way to store all ERC20 token types
    struct sERC20_token {
        address tokenAddress;
        uint ID;
        bool available;
    }

    // @dev mapping address to struct sERC20_token
    mapping(address => sERC20_token) public sERC20_tokens;

    // @dev number of ERC20 tokens registered inside of this smart contract
    uint[] private sERC20_tokens_Array;

    // @dev mapping of all sERC20 tokens 
    // @dev USER address => ERC20 address => ERC20_balance uint 
    mapping(address => mapping(address => uint)) public ERC20_balance;


    // @dev add new token to smart contract
    function newToken(address token) public {

        uint ID = sERC20_tokens_Array.length;

        sERC20_tokens[token].tokenAddress = token;
        sERC20_tokens[token].ID = ID;
        sERC20_tokens[token].available = true;

        sERC20_tokens_Array.push(ID);

    }

    // @dev deposit ERC20 token and receive staked/wrapped ERC20 token
    function addLiquidity(address token, uint amount) public returns (uint) {

        require(sERC20_tokens[token].available != false, "ERC20 token not added");
        require(amount > 0, "Cannot stake 0");

        // @dev this is balance of ERC20 token, not sERC20 token
        ERC20_balance[msg.sender][token] += amount;
        
        IERC20(token).transferFrom(msg.sender, address(this), amount);

        uint ID = sERC20_tokens[token].ID;

        _mint(msg.sender, ID, amount, "");

        return balanceOf(msg.sender, ID);

    }

    // @dev withdraw ERC20 token and automatically burns the staked/wrapped ERC20 token
    function withdrawLiquidity(address token, uint amount) public returns (uint) {

        require(sERC20_tokens[token].available != false, "ERC20 token not added");
        require(ERC20_balance[msg.sender][token] >= amount, "insufficient balance");


        ERC20_balance[msg.sender][token] -= amount;

        uint ID = sERC20_tokens[token].ID;

        _burn(msg.sender, ID, amount);

        IERC20(token).transfer(msg.sender, amount);
        

        return balanceOf(msg.sender, ID);

    }


}
