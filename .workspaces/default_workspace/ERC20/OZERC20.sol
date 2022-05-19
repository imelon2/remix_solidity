// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(string memory name, string memory symbol) ERC20(name,symbol) {
        // mint 1000
        _mint(msg.sender, 1000*10**uint(decimals()));
    }
}