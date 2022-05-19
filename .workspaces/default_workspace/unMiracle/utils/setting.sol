// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

library Setting {
    struct SetInfo {
        uint256 deadline;
        uint256 amount;
        uint256 currentAmount;
    }
    /* 
    @dev 현재시간 milliseconds
    * param set time
    **/
    function setDeadline(SetInfo storage info, uint256 timestamp) internal {
        info.deadline = timestamp * 1000;
    }

    function getDeadline(SetInfo memory info) internal pure returns(uint256) {
        return info.deadline;
    }

    function setAmount(SetInfo storage info, uint256 amount) internal {
        info.amount = amount;
    }

    function getAmount(SetInfo memory info) internal pure returns(uint256) {
        return info.amount;
    }

    function setCurrentAmount(SetInfo storage info, uint256 amount) internal {
        info.amount = info.amount + amount;
    }

    function getCurrentAmount(SetInfo memory info) internal pure returns(uint256) {
        return info.amount;
    }



}