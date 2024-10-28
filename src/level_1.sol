pragma solidity ^0.8.26;

interface Isolution1 {
    function solution(
        uint256[2][3] calldata x, 
        uint256[2][3] calldata y
    ) external pure returns (
        uint256[2][3] memory
    );
}

contract Level1 {

    function solution(uint256[2][3] calldata x, uint256[2][3] calldata y) external pure returns (uint256[2][3] memory finalArray) {
        assembly {
           
            // call data structure: 
            // 0x00: 4 bytes - function selector
            // 0x04: 32 bytes - x[0][0]
            // 0x24: 32 bytes - x[0][1]
            // 0x44: 32 bytes - x[1][0]
            // 0x64: 32 bytes - x[1][1]
            // 0x84: 32 bytes - x[2][0]
            // 0xa4: 32 bytes - x[2][1]
            // 0xc4: 32 bytes - y[0][0]
            // 0xe4: 32 bytes - y[0][1]
            // 0x104: 32 bytes - y[1][0]
            // 0x124: 32 bytes - y[1][1]
            // 0x144: 32 bytes - y[2][0]
            // 0x164: 32 bytes - y[2][1]
            // 0x184: 32 bytes - y[2][2]
            
            let ptr := mload(0x40) // free memory pointer
            let x00 := calldataload(0x04) // x[0][0]
            let y00 := calldataload(0xc4) // y[0][0]
            let sum0 := add(x00, y00)
            if lt(sum0, x00) { revert(0, 0) }
            if lt(sum0, y00) { revert(0, 0) }
            mstore(ptr, sum0) // m[0,0] = x[0][0] + y[0][0]
            
            for {let i := 1} lt(i,6) {i := add(i,1)} {
                let offset := mul(i, 0x20)
                let x_i := calldataload(add(offset,0x04)) // x[i]
                let y_i := calldataload(add(offset,0xc4)) // y[i]
                let sum := add(x_i, y_i)
                if lt(sum, x_i) { revert(0, 0) }
                if lt(sum, y_i) { revert(0, 0) }
                mstore(add(ptr, offset), sum) // m[i] = x[i] + y[i]
            }
            return(ptr, 0x120)
        }

    }
}