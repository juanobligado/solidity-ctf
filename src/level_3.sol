pragma solidity ^0.8.26;
contract Level3 {
    function solution(bytes memory packed) external pure returns (uint16 a, bool b, bytes6 c) {
        // | uint16 | bool | bytes6 = 2 + 1 + 6 = 9 bytes
        require(packed.length == 9);
        assembly {
            // Decode uint16 (stored in 256 byte word)
            a := mload(add(packed, 0x20))
            a := shr(240, a) // Shift right by 240 bits (256 - 16) to get the uint16 value
            // Decode bool
            b := byte(0,mload(add(packed, 0x22)))

            // Decode bytes6
            c := mload(add(packed, 0x23))
        }
    }


}