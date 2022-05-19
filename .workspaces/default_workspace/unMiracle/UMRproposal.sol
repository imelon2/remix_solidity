// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./utils/setting.sol";
import "./IUMRcore.sol";

contract UMRproposal is IUMRcore{
    using Setting for Setting.SetInfo;

    struct ProposalCore {
        Setting.SetInfo donationStart;
        Setting.SetInfo donationEnd;
        Setting.SetInfo donateMinimum;
        Setting.SetInfo donate;
        bool executed;
        bool canceled;
    }

    mapping(uint256 => ProposalCore) private _proposals;


    function state(uint256 proposalId) public view returns (ProposalState) {
        ProposalCore storage proposal = _proposals[proposalId];

        // 기부_스마트컨트렉트가 실행 됬을 경우
        if (proposal.executed) {
            return ProposalState.Executed;
        }

        // proposal이 취소된 경우
        if (proposal.canceled) {
            return ProposalState.Canceled;
        }

        uint256 snapshot = proposalSnapshot(proposalId);

        // 기부 활성화 대기 중
        if (snapshot >= block.timestamp) {
            return ProposalState.Pending;
        }

        uint256 deadline = proposalDeadline(proposalId);

        // 기부 진행 중
        if (deadline >= block.timestamp) {
            return ProposalState.Active;
        }

        // 성공 
        return ProposalState.Succeeded;
    }


    function hashProposal(
        address[] memory destination, // 기부금 도착지
        bytes[] memory calldatas, // on-chain smart contract call data
        bytes32 descriptionHash // proposal 설명
    ) public pure returns (uint256) {
        return uint256(keccak256(abi.encode(destination, calldatas, descriptionHash)));
    }

    function proposal(
        uint256 donateDelay, // n day후 기부 시작
        uint256 donatePeriod, // n day후 기부 종료 및 전달
        uint256 donateMinimum, // 0.5 = 0.5ETH
        address[] memory destination, // 기부단체 주소
        bytes[] memory calldatas, // execute 시 발동될 스마트컨트렉트
        string memory description // 기부 안건 내용
    ) public returns(uint256) {
        // 작성자 = 주인
        // address proposer = msg.sender;

        // 안건 번호 생성
        uint256 proposalId = hashProposal(destination, calldatas, keccak256(bytes(description)));
        // uint256 proposalId = 1;

        // mapper 구성 생성
        ProposalCore storage proposal = _proposals[proposalId];

        // 제안 시작 시간
        uint256 snapshot =  block.timestamp + donateDelay*24*60*60;
        // 제안 종료 시간
        uint256 deadline = snapshot + donatePeriod*24*60*60;

        // mapper에 저장
        proposal.donationStart.setDeadline(snapshot);
        proposal.donationEnd.setDeadline(deadline);
        proposal.donateMinimum.setAmount(donateMinimum);

        return proposalId;
    }

    // 제안 시작 시간 get
    function proposalSnapshot(uint256 proposalId) public view virtual returns (uint256) {
        return _proposals[proposalId].donationStart.getDeadline();
    }
    // 제안 종료 시간 get
    function proposalDeadline(uint256 proposalId) public view virtual returns (uint256) {
        return _proposals[proposalId].donationEnd.getDeadline();
    }
    // 제안 최소 기부 가능 금액 get
    function proposalDonateMinimum(uint256 proposalId) public view virtual returns (uint256) {
        return _proposals[proposalId].donateMinimum.getAmount();
    }

    // 제안에 기부금 추가
    /* wei단위로 dapp에서 ether를 wei로 변환해야 합니다. 
     * 솔리디티는 소수점 지원 x
     * 1ether = 10**18 wei
    **/
    function setCurrentAmount(uint256 proposalId,uint256 amount) public virtual {
        _proposals[proposalId].donate.setCurrentAmount(amount);
    }

    // 제안에 예치된 기부금 get
    function getCurrentAmount(uint256 proposalId) public view virtual returns (uint256) {
        return _proposals[proposalId].donate.getCurrentAmount();
    }

    function execute(
        address[] memory destination, // 기부단체 주소
        bytes[] memory calldatas, // execute 시 발동될 스마트컨트렉트
        string memory description // 기부 안건 내용
        ) public payable returns(uint256) {
        
            // 안건 번호 생성
            uint256 proposalId = hashProposal(destination, calldatas, keccak256(bytes(description)));

            ProposalState status = state(proposalId);

            require(
            status == ProposalState.Succeeded,
            "Governor: proposal not successful"
            );

            // 총 모인 기부금
            uint256 values = getCurrentAmount(proposalId);

            // 스마트컨트렉트 실행
            _execute(destination, values, calldatas);

            // proposal 통과 완료
            _proposals[proposalId].executed = true;

            return proposalId;
        }

    function _execute(
        // uint256 proposalId, // proposal 번호
        address[] memory destination, // 기부단체 주소
        uint256 values, // 기부될 금액
        bytes[] memory calldatas // execute 시 발동될 스마트컨트렉트
    ) internal virtual {
        string memory errorMessage = "Governor: call reverted without message";
        for (uint256 i = 0; i < destination.length; ++i) {
            (bool success, bytes memory returndata) = destination[i].call{value: values / i}(calldatas[i]);
            // Address.verifyCallResult(success, returndata, errorMessage);
        }
    }
}