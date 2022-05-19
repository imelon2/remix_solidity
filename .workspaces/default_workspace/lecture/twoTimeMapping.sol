// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

contract twoTimeMappintC {

    mapping( uint => mapping(uint => string)) public test;

    function set(uint _id,uint id, string memory _str) public {
        test[_id][id] = _str;
    }

    function get(uint _id, uint id) public view returns(string memory) {
        return test[_id][id];
    }
}