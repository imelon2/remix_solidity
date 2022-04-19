// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract continueBreak {


    event CountryIndexName(uint _index, string _name);
    string[] private counrtryList = ["South Kore","North Korea","USA","CHINA","Japan"];
    
    function useContinue() public {
        for(uint i =0; i < counrtryList.length; i++ ) {
            if(i%2==1) {
                continue;
            }
            emit CountryIndexName(i,counrtryList[i]); 
        }
    }

    function useBreak() public {
        for(uint256 i = 0; i < counrtryList.length; i++ ) {
            if(i == 2) {
                break;
            }
            emit CountryIndexName(i,counrtryList[i]); 
        }
    }
}