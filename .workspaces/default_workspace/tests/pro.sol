// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./time.sol";

contract pro {
    using Time for Time.Timestamp;

    uint id = 0;
    struct ProposalCore {
        Time.Timestamp donationStart;
    }
    mapping(uint256 => ProposalCore) private _proposals;
    
    function test() public {

        ProposalCore storage proposal = _proposals[id];
        id = id + 1;

        proposal.donationStart.currentTime();
    }

    function get(uint num) public view returns(ProposalCore memory) {
        return _proposals[num];
    }
}