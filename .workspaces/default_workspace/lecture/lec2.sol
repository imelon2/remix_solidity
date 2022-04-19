// SPDX-License-Identifier: GPL-30

pragma solidity >=0.7.0 < 0.9.0;

contract lec2 {
    bool public b = false;

    bool public b1 = !false; // true
    bool public b2 = false || true; // true
    bool public b3= false == true; // false
    bool public b4 = false && true; // false

    bytes4 public bt = 0x12345678;
    bytes public bt2 = "STRING"; //0x535452494e47 = n*2 -1

    bytes public bt3 = "ABCDEFGHIJK"; //  0x4142434445464748494a4b = n*2 -1

    // 계좌번호와 같은 역할
    // address를 통해 사람들과 주고 받는 ID같은 정보
    address public addr =  0xf8e81D47203A594245E36C48e151709F0C19fBe8; // bytes20 (40개)

    //int vs uint
    // int8 : -2^7 ~ 2^7 -1
    int8 public it = 4;   
    // uint8 : 0 ~ 2^8-1 (256)
    // uint == uint256;
    uint256 public uit = 132213;

    // + - * / % 
}