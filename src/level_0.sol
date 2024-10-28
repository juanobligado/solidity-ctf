// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

/////////////////// ☆☆ extropyio ☆☆ /////////////////////
//     -漫~*'¨¯¨'*·舞~ solidity ctf ~舞·*'¨¯¨'*~漫-     //
/////////////////////////////////////////////////////////

/*
    interface Isolution {
        function solution() external pure returns (uint8);
    }
*/

contract Level0 {

/*
    constructor(){
        assembly {
            // Directly manipulate the free memory pointer
            // This is generally not recommended
            mstore(0x40, 0x80)
        }
    }
  */  

	  function solution() external pure returns (uint8){
        return(42);
      }
}