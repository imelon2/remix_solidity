// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;

contract storageC {
    
    uint a = 100;
    
    function get_string(string memory _str) public pure returns( string memory){
        return _str;
    }
}