// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract errorHandleC {

    /*  0.8.1 ~ 부터 가능한 기능 (0.8.0 x ) */
    /*
    assert : 
    - 오직 내부적 에러 테스트 용도, 불변성 체크 용도.
    - 이제 gas를 환불 받을 수 있습니다.
    - assert가 발생되면, 애러 타입 Panic(uint256)이 호출됩니다.

    - Solidity 공식 문서 
    https://docs.soliditylang.org/en/v0.8.13/control-structures.html#error-handling-assert-require-revert-and-exceptions
    */
    

    //3000000 gas 
    function assertNow() public pure{
        assert(false); // test 
    }  
    //21322 gas
    function revertNow() public pure{
        revert("error!!"); // if or require = if + revert;
    }
    
    //21338 gas
    function requireNow()public pure{
        require(false,"occurred");
    }
}