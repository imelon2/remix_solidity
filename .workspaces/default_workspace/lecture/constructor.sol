// SPDX-License-Identifier: GPL-30

pragma solidity >=0.7.0 < 0.9.0;

// constructor : 변수 값을 초기화 할 때, 사용
contract A {

    string public name;
    uint public age;

    constructor(string memory _name, uint _age) {
        name = _name;
        age = _age;
    }

    function change(string memory pName,uint pAge) public {
        name = pName;
        age = pAge;
    }
}

contract B {
    A instance = new A("borntodevelop",28);

    function get() public view returns(string memory , uint) {
        return (instance.name(), instance.age());
    }
    function change(string memory pName,uint pAge) public {
        instance.change(pName,pAge);
    }
}