// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

import {Test, console} from "forge-std/Test.sol";
import {Level1} from "../src/level_1.sol";

contract LevelTest is Test {
    Level1 public level_1;

    function setUp() public {
        level_1 = new Level1();
    }

    function test_add() public {
        uint256[2][3] memory x = [
            [uint256(1), uint256(2)],
            [uint256(3), uint256(4)],
            [uint256(5), uint256(6)]
        ];
        uint256[2][3] memory result = level_1.solution(x, x);

                // Output the result to the console
        console.log("Result[0][0]:", result[0][0]);
        console.log("Result[0][1]:", result[0][1]);
        console.log("Result[1][0]:", result[1][0]);
        console.log("Result[1][1]:", result[1][1]);
        console.log("Result[2][0]:", result[2][0]);
        console.log("Result[2][1]:", result[2][1]);
        
        assertEq(result[0][0], 2);
        assertEq(result[0][1], 4);
        assertEq(result[1][0], 6);
        assertEq(result[1][1], 8);
        assertEq(result[2][0], 10);
        assertEq(result[2][1], 12);

    }

    // test overflow
    function test_overflow() public {
        uint256[2][3] memory x = [
            [type(uint256).max, type(uint256).max],
            [uint256(3), uint256(4)],
            [uint256(5), uint256(6)]
        ];
        uint256[2][3] memory y = [
            [uint256(1), uint256(2)],
            [uint256(3), uint256(4)],
            [uint256(5), uint256(6)]
        ];
        // Expect revert due to overflow
        vm.expectRevert();
        level_1.solution(x, y);
        
    }

}