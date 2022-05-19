// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

library Time {
    struct Timestamp {
        uint256 deadline;
    }
    /* 
    @dev 현재시간 milliseconds
    **/
    function currentTime(Timestamp storage timer) public returns(uint256) {
        return timer.deadline =  block.timestamp * 1000;
    }



}