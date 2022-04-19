// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;


/*
0.6 버전 이후  
try/catch 왜 써야하는가? 
	기존의 에러 핸들러 assert/revert/require는 에러를 발생시키고 프로그램을 끝냄.
	그러나, try/catch로 에러가 났어도, 프로그램을 종료시키지 않고 어떠한 대처를 하게 만들수 있다.


try/catch 특징

1.
try/catch문 안에서, assert/revert/require을 통해 에러가 난다면 catch는 에러를 잡지를 못하고, 
	            개발자가 의도한지 알고 정상적으로 프로그램  끝낸다
try/catch문 밖에서 assert/revert/require을 통해 에러가 난다면 catch는 에러를 잡고, 에러를 핸들할수 있다

2. 3가지 catch
catch Error(string memory reason) { ... } : revert 나 require을 통해 생성된 에러용도
catch Panic(uint errorCode) { ... } :  assert 를 통해 생선된 에러가 날 때 이 catch에 잡혀요. 
errorCode 는  솔리디티에서 정의 Panic 에러 별로 나온답니다. 
0x00: Used for generic compiler inserted panics.
0x01: If you call assert with an argument that evaluates to false.
0x11: If an arithmetic operation results in underflow or overflow outside of an unchecked { ... } block.
0x12; If you divide or modulo by zero (e.g. 5 / 0 or 23 % 0).
0x21: If you convert a value that is too big or negative into an enum type.
0x22: If you access a storage byte array that is incorrectly encoded.
0x31: If you call .pop() on an empty array.
0x32: If you access an array, bytesN or an array slice at an out-of-bounds or negative index (i.e. x[i] where i >= x.length or i < 0).
0x41: If you allocate too much memory or create an array that is too large.
0x51: If you call a zero-initialized variable of internal function type.
예를들어, 나누기가 0 이 된다면 0x12(=18) errorCode 를 리턴해요. 
한가지더, Panic은 0.8.0 버전에는 없고 0.8.1 버전 부터 있습니다. 
catch(bytesmemorylowLevelData){...} : 이 catch는 로우 레벨에러를 잡습니다. 

3. 어디서 쓰는가?
★ 외부 스마트 컨트랙을 함수를 부를때 : 다른 스마트 컨트랙을 인스턴스화 하여서, try/catch문이 있는 스마트 컨트랙의 함수를 불러와서 사용.
외부 스마트 컨트랙을 생성 할 때(instance) : 다른 스마트컨트랙을 인스턴스화 생성 할 때 씀
스마트컨트랙 내에서 함수를 부를때: this를 통해  try/catch를 씀 
*/


// 외부 스마트 컨트랙 함수 부를때
contract character{
    
    string private name;
    uint256 private power;
    
    constructor(string memory _name, uint256 _power){
        name = _name;
        power = _power;
    }

}

contract runner{
    
    event catchOnly(string _name,string _err);
    
    function playTryCatch(string memory _name, uint256 _power) public returns(bool){
        
        try new character(_name,_power) {
            // revert("errors in the try/catch block");
            return(true);
        }
        catch{
            emit catchOnly("catch","ErrorS!!");
            return(false);
        }
        
        
    } 
}
//스마트컨트랙 내에서 함수를 부를때



contract runner2{
    event catchOnly(string _name,string _err);
    
    function simple() public returns(uint256){
        return 4;
    }
    
    
    function playTryCatch() public returns(uint256,bool){
        
        try this.simple() returns(uint256 _value){
            return(_value,true);
        }
        catch{
            emit catchOnly("catch","ErrorS!!");
            return(0,false);
        }
        
        
    } 
}
 