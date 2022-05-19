// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import './UMRcore.sol';

contract UMRsetting is UMRCcore {

    uint256 private _donateDelay; // 0
    uint256 private _donatePeriod; // 45818 = 1 week
    uint256 private _donateMinimum; // 0.5 = 0.5ETH

    constructor(
        uint256 initialDonateDelay,
        uint256 initialDonatePeriod,
        uint256 initialDonateMinimum,
    ) {
        _setDonateDelay(initialDonateDelay);
        _setDonatePeriod(initialDonatePeriod);
        _setDonateMinimum(initialDonateMinimum);
    }

    function setDonateDelay(uint256 newVotingDelay) public virtual onlyGovernance {
        _setVotingDelay(newVotingDelay);
    }
    function setDonatePeriod(uint256 newVotingDelay) public virtual onlyGovernance {
        _setVotingDelay(newVotingDelay);
    }
    function setDonateMinimum(uint256 newVotingDelay) public virtual onlyGovernance {
        _setVotingDelay(newVotingDelay);
    }

    function _setDonateDelay(uint256 newVotingDelay) internal virtual {
        emit VotingDelaySet(_votingDelay, newVotingDelay);
        _votingDelay = newVotingDelay;
    }
    
    function _setDonatePeriod(uint256 newVotingPeriod) internal virtual {
        require(newVotingPeriod > 0, "GovernorSettings: voting period too low");
        emit VotingPeriodSet(_votingPeriod, newVotingPeriod);
        _votingPeriod = newVotingPeriod;
    }

    function _setDonateMinimum(uint256 newProposalThreshold) internal virtual {
        emit ProposalThresholdSet(_proposalThreshold, newProposalThreshold);
        _proposalThreshold = newProposalThreshold;
    }
}