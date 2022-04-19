// SPDX-License-Identifier: GPL-30

pragma solidity >=0.7.0 < 0.9.0;


contract lec5 {
    // public: 모든곳에서 접근 가능
    // external: public 처럼 모든곳에서 접근 가능하나, external이 정의된 자기 자신 컨트랙 내에서 접근 불가
    // private: 오직 private이 정의된 자기 컨트랙에서만 가능( private이 정의된 컨트랙을 상속 받은 자식도 불가능)
    // internal: private 처럼 오직 internal이 정의된 자기 컨트랙에서만 가능하고, internal이 정의된 컨트랙을 상속

    //1. public
    uint256 public a = 5;

    //2. private
    uint256 private a2 = 10;

    //3. 
}