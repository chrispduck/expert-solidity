//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

contract TryingYul {
    // returns msg.value implementd in assembly
    function paidValue() public payable returns (uint256){
        assembly {
            let x := callvalue()
            mstore(0x0, x)
            return(0x0, 32)
        }
    } 

    function paidValueSolidity() public payable returns (uint256){
       return msg.value;
    } 
}
