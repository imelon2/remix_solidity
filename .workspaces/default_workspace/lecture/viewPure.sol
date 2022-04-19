// SPDX-License-Identifier: GPL-30

pragma solidity >=0.7.0 < 0.9.0;

// view : function 밖의 변수들을 읽을 수 있으나 변경 불가능
// pure : function 밖의 변수들을 읽지는 못하고 변경도 불가능
// 둘다 명시 안할 경우 : function 밖의 변수들 읽기, 변경

contract viewPure {

    uint val = 10;

    function func1() view returns(uint) {
        uint a = 10 + val;
        return a;
    }

    function func2() pure returns(uint) {
        uint a = 10 + 10;
        return a;
    }

    function func3() view returns(uint) {
        val = 10 + val;
        return val;
    }
}