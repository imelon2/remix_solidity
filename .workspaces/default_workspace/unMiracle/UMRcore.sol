// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import './UMRproposal.sol';

contract UMRcore is UMRproposal{
    address public owner;


    constructor() {
        owner = msg.sender;
    }


    function getOwner() public view returns(address) {
        return owner;
    }

}