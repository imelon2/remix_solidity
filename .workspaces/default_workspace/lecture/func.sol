// SPDX-License-Identifier: GPL-30

pragma solidity >=0.7.0 < 0.9.0;

contract func {

    uint public val = 10;

    function func1(uint _val) public returns(uint) {
        val = _val;
        return val;
    }
}
