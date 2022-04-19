// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract linearSearchC {


    event CountryIndexName(uint _index, string _name);
    string[] private counrtryList = ["South Kore","North Korea","USA","CHINA","Japan"];
    

    
    function linearSearch(string memory _search) public view returns(uint,string memory) {
        for(uint i = 0; i < counrtryList.length; i++ ) {
            //keccak256 : value 해쉬화
            // 솔리디티에는 문자열 비교가 불가능
            // ex ) "aaa" === "aaa" (x)
            if(keccak256(bytes(counrtryList[i])) == keccak256(bytes(_search))) {
                return (i,counrtryList[i]);
            }
        }

        return (0,"Nothing In Array");
    }
}