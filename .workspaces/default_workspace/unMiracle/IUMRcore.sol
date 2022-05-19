// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract IUMRcore {
    enum ProposalState {
        Pending,
        Active,
        Canceled,
        // Defeated, // 기부금이 안모여서 실패할 경우
        Succeeded,
        // Queued, // 대기중
        Expired,
        Executed
    }
}