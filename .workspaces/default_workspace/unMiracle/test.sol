// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Timers.sol";
import "@openzeppelin/contracts/utils/math/SafeCast.sol";

contract test {


    struct testS {
        string name;
        uint num;
    }

    mapping(uint256 => testS) private _testS;


    // function num() public view returns(uint256) {
    //     uint256 result =  1212536 / 10**9 ether;
    //     // uint256 result = uint256(a*10^18);
    //     return result;
    // }

    function _executor() public view returns (address) {
        return address(this);
    }

    function time() public returns(uint256){
        uint256 re = block.timestamp + 5*24*60*60;
        return re;
    }

    function name() public returns(string memory) {
        return 'wonhyeok';
    }
    
    // function structTest() public returns(testS memory) {
    //     testS storage t = _testS[10];
    //     t.name.name();
    //     return _testS[123];
    // }

    function keccak256test() public returns(bytes memory) {
        // return uint256(keccak256(bytes("description")));
        // return bytes("description");
        // return uint256(keccak256(bytes("description")));

        return  abi.encode(1,45804,5000); 
    }

    function abiEncode() public returns(bytes memory) {
        return abi.encode(1,45804,5000);
    }
    function abiDecode(bytes memory data) public returns(uint _str1, uint _number, uint _str2) {
        (_str1, _number, _str2) = abi.decode(data, (uint, uint, uint));            
    }


    function votingDelay() public pure returns(uint256) {
        return 1;
    }

    function votingPeriod() public pure returns(uint256) {
        return 45818; // 1week
    }

    function snapshot() public view returns(uint64) {
        uint64 snapshot = uint64(block.number) + uint64(votingDelay());

        return snapshot;
    }

    function deadline() public view returns(uint64) {
        uint64 snapshot = uint64(block.number) + uint64(votingDelay());
        uint64 deadline = snapshot + uint64(votingPeriod());

        return deadline;
    }
}