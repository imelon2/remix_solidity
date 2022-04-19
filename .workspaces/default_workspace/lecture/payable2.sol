// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

/*

주소.balance
주소.balance는 해당 특정 주소의 현재 갖고있는  이더의 잔액을 나타 냅니다. (msg.value는 송금액) 
주소.balance 와 같은 형태로 사용합니다.


msg.sender 


 (msg.sender)
    사람A -> 스마트컨트랙 
(송금하는 사람 주소)

msg.sender 는 ★스마트컨트랙을 사용하는 하는 주체라고 볼 수 있습니다.  
msg.sender는 앞으로 설명해야 할 call vs delegate call에서 주요 내용이니 관심있게 봐주세요

*/

// payable을 생성자에 넣을때
// 특정 주소에게만 권한 주기

contract MobileBanking{
    
    
    address owner;
    // 스마트 컨트랙트 베포 시, 제일 먼저 실행 == 이더를 받는 것
    constructor() payable {
        owner = msg.sender;
    }

    modifier onlyOwner{
        _;
        require(msg.sender == owner, "Only Owner!");
    }
    

    event SendInfo(address _msgSender, uint256 _currentValue);
    event MyCurrentValue(address _msgSender, uint256 _value);
    event CurrentValueOfSomeone(address _msgSender, address _to,uint256 _value);
   
    function sendEther(address payable _to) public onlyOwner payable {
        // require(msg.sender == owner, "Only Owner !"); => modifier
        require(msg.sender.balance>=msg.value, "Your balance is not enough");
        _to.transfer(msg.value);    
        emit SendInfo(msg.sender,(msg.sender).balance);
    }
    
    function checkValueNow() public onlyOwner{
        emit MyCurrentValue(msg.sender, msg.sender.balance);
    }
    
    function checkUserMoney(address _to) public onlyOwner{
        emit CurrentValueOfSomeone(msg.sender,_to ,_to.balance);
    }
    
}