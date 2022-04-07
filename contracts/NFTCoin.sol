// SPDX-License-Identifier:MIT

pragma solidity >= 0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract NFTCoin is ERC20{
    constructor() ERC20("NFTCoin","NFTC"){
        // _mint()
    }
}