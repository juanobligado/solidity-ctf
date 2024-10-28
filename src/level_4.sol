pragma solidity ^0.8.26;
contract Level4 {
    // stdin: 1                     stdout: 1 or 2**0
    // stdin: 10                    stdout: 8 or 2**3
    // stdin: 21                    stdout: 16 or 2**4
    // stdin: 2048                  stdout: 2048 or 2**11
    // stdin: 9223372036854775808   stdout: 9223372036854775808 or 2**63
    // stdin: 0xffffffff            stdout: 2147483648 or 0x80000000 or 2**31
    function solution(uint256 _number) external pure returns (uint256) {

       assembly {
            // Initialize the result to 0
            let result := 0

            // Binary search for the most significant bit
            if gt(_number, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF) {
                _number := shr(128, _number)
                result := add(result, 128)
            }
            if gt(_number, 0xFFFFFFFFFFFFFFFF) {
                _number := shr(64, _number)
                result := add(result, 64)
            }
            if gt(_number, 0xFFFFFFFF) {
                _number := shr(32, _number)
                result := add(result, 32)
            }
            if gt(_number, 0xFFFF) {
                _number := shr(16, _number)
                result := add(result, 16)
            }
            if gt(_number, 0xFF) {
                _number := shr(8, _number)
                result := add(result, 8)
            }
            if gt(_number, 0xF) {
                _number := shr(4, _number)
                result := add(result, 4)
            }
            if gt(_number, 0x3) {
                _number := shr(2, _number)
                result := add(result, 2)
            }
            if gt(_number, 0x1) {
                result := add(result, 1)
            }

            // Calculate the power of 2
            let pow := shl(result, 1)

            // Store the result in memory and return it
            mstore(0x40, pow)
            return(0x40, 0x20)
        }
    }
}