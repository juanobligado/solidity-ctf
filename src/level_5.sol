pragma solidity ^0.8.26;
contract Level5 {
    // Give an overflow-free method for computing the average, rounding up, of 2 signed integers, (a + b) / 2 
    // Your function will take 2 values (a,b) and return the average of these values
    // Keep in mind that you will be rounding the average up (ceil) NOT rounding down (floor)
    // Floor -> rounding towards zero
    // Ceil -> rounding away from zero
    function solution(int256 a, int256 b) external pure returns (int256) {

        assembly {

            if eq(a,b) {
                mstore(0x40, a)
                return(0x40, 0x20)
            }
            // Calculate the sum of a and b
            let  a_xor_b_is_odd := xor(and(a,1),and(b,1))

            // 
            let sum := add(sdiv(a, 2),sdiv(b,2))

            // Check if the sum is negative
            let isNegative := slt(sum, 0)

            // Add 1 if the sum is positive and a or b is odd (hence a+b is odd)
            let addOne := and(iszero(isNegative), a_xor_b_is_odd)

            // Calculate the average, rounding up
            let avg := add(sum, addOne)

            // Return the result
            mstore(0x40, avg)
            return(0x40, 0x20)
        }
    }
}