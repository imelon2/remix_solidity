// SPDX-License-Identifier: GPL-30

pragma solidity >=0.7.0 < 0.9.0;

contract A {
    uint public a = 5;

    function func1(uint _val) public {
        a = _val;
    }
}

contract B {
    A instance = new A();

    function get_a() public view returns(uint) {
        return instance.a();
    }

    function change_a(uint _value) public {
        instance.func1(_value);
    }   
}