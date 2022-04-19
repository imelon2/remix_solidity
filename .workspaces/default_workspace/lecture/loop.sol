// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract loopC {

    event CountryIndexName(uint _index, string _name);
    string[] private counrtryList = ["South Kore","North Korea","USA","CHINA","Japan"];


    // for
    function forLoopEvents() public {
        for(uint i = 0; i < counrtryList.length; i++ ) {
            emit CountryIndexName(i,counrtryList[i]);
        }
    }

    // while
    function whileLoopEvents() public {
        uint256 i = 0;
        while(i < counrtryList.length) {
            emit CountryIndexName(i,counrtryList[i]);
            i++;
        }
    }

    //do - while
    function doWhileLoopEvents() public {
        uint i = 0;
        do {
            emit CountryIndexName(i,counrtryList[i]);
            i++; 
        }
        while(i < counrtryList.length);
    }
}