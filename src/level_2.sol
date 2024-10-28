pragma solidity 0.8.26;

contract Level2{
        
    function solution(uint256[10] calldata unsortedArray) external pure returns (uint256[10] memory sortedArray){

        assembly {
                        // Loop through each element in the unsorted array
            for { let i := 0 } lt(i, 10) { i := add(i, 1) } {
                // Load the pivot element from the unsorted array
                let pivot := calldataload(add(0x04, mul(i, 0x20)))
                // Initialize j to i
                let j := i

                // Shift elements greater than pivot to the right
                if gt(j, 0) {
                    let prev := mload(add(sortedArray, mul(sub(j, 1), 0x20)))
                    for {} and(gt(j, 0), gt(prev, pivot)) {} {
                        mstore(add(sortedArray, mul(j, 0x20)), prev)
                        j := sub(j, 1)
                        if gt(j, 0) {
                            prev := mload(add(sortedArray, mul(sub(j, 1), 0x20)))
                        }
                    }
                }

                // Insert the pivot element at the correct position
                mstore(add(sortedArray, mul(j, 0x20)), pivot)
                
            }
        } 
        /*
        for (uint i = 0; i < 10; i++) {
            uint pivot = unsortedArray[i];
            // previous element
            uint256 j = i;
            // go from right to left
            // Shift elements elements greater than item_to_insert right

            while (j > uint256(0) && sortedArray[j-1] > pivot) {
                sortedArray[j] = sortedArray[j-1];
                j--;
            }
            sortedArray[j] = pivot;
        }*/
        return sortedArray;   
    }

}