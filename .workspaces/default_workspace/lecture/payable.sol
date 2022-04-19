// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;
    /*
Payable 
Payable은 이더/토큰과  상호작용시 필요한 키워드라고 생각하시면 간단합니다. 
즉, send, trnafer, call을 이용하여, 이더를 보낼때 Payable이라는 키워드가 필요 합니다.
이 Payable은 주로 함수,주소,생성자에 붙여서 사용된답니다.

msg.value
msg.value는 송금보낸 코인의 값 입니다.

이더를 보내는 3가지 
    1.send : 2300 gas를 소비, 성공여부를 true 또는 false로 리턴한다
    2.transfer : 2300 gas를 소비, 실패시 에러를 발생 0.4.13 ~
    3.call : 가변적인 gas 소비 (gas값 지정 가능), 성공여부를 true 또는 false로 리턴
             재진입(reentrancy) 공격 위험성 있음, 2019년 12월 이후 call 사용을 추천. 이더리움 이스탄불 하드포크
             - Checks-Effects-Interactions patern -
             https://docs.soliditylang.org/en/v0.8.13/security-considerations.html?highlight=checks%20effects%20interactions#re-entrancy
    */
contract payableC {
    event howMuch(uint256 _value);
    
                        //payable _to == 돈을 받는 사람의 주소  
                                                // 끝에 payable를 붙히는 이유는 함수 자체를 "송금의 함수다" 라고 정의하는 것
    function sendNow(address payable _to) public payable{
        bool sent = _to.send(msg.value); // return true or false
        require(sent,"Failed to send either");
        emit howMuch(msg.value);
    }
    
    function transferNow(address payable _to) public payable{
        _to.transfer(msg.value);
        emit howMuch(msg.value);
    }

    function callNow (address payable _to) public payable{
        // ~ 0.7
        // (bool sent, ) = _to.call.gas(1000).value(msg.value)("");
        // require(sent,"Failed to send either");
        
        //0.7 ~                                     // 가스의 비용이 증가 할 수 있기 때문에, 비추....
        (bool sent, ) = _to.call{value: msg.value , gas:1000}("");
        require(sent, "Failed to send Ether");
        emit howMuch(msg.value);
        
    }
}