// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

import {Test, console} from "forge-std/Test.sol";
import {Level2} from "../src/level_2.sol";

contract LevelTest is Test {
    Level2 public level_2;

    function setUp() public {
        level_2 = new Level2();
    }


    function test_sorting() public {
        uint256[10] memory x = [
            uint256(1), uint256(2), uint256(4),uint256(5),uint256(10),uint256(3),uint256(6),uint256(7), uint256(8),uint256(9)
        ];
        uint256[10] memory result = level_2.solution(x);
        for (uint i = 0; i < 10; i++) {
            console.log("Result[", i, "]:", result[i]);
            assertEq(i+1, result[i]);
        }
    }

    function test_sorting_2() public {
        uint256[10] memory x = [
            uint256(10), uint256(2), uint256(4),uint256(5),uint256(10),uint256(10),uint256(6),uint256(7), uint256(1),uint256(9)
        ];
        uint256[10] memory result = level_2.solution(x);
        assertEq(result[0],uint256(1));
        assertEq(result[9],uint256(10));
        assertEq(result[8],uint256(10));

    }


}