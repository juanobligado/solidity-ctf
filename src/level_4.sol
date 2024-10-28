pragma solidity ^0.8.26;
import {console} from "forge-std/Test.sol";
contract Level4 {
    // stdin: 1                     stdout: 1 or 2**0
    // stdin: 10                    stdout: 8 or 2**3
    // stdin: 21                    stdout: 16 or 2**4
    // stdin: 2048                  stdout: 2048 or 2**11
    // stdin: 9223372036854775808   stdout: 9223372036854775808 or 2**63
    // stdin: 0xffffffff            stdout: 2147483648 or 0x80000000 or 2**31
    function solution(uint256 _number) external pure returns (uint256) {
        // TODO: Write your solution here
        assembly{
            // find the most significant bit
            let pow := 1 // get the free memory pointer
            for {let i := 0} lt(i, 256) {i := add(i, 1)} {
                _number := shr(1, _number)
                if iszero(_number) {
                    break
                }
                pow := shl(1, pow)
            }
            mstore(0x40, pow)
            return(0x40, 0x20)
        }
    }
}