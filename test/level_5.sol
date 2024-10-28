// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

import {Test, console} from "forge-std/Test.sol";
import {Level5} from "../src/level_5.sol";

contract Level5Test is Test {
    Level5 public level_5;

    function setUp() public {
        level_5 = new Level5();
    }


    function test_sum_positive() public {
        int256 a = level_5.solution(10,10);
        assertEq(a, 10);

        // ceil(10 + 11) / 2 = ceil(21 / 2) = ceil(10.5) = 11  
        assertEq(level_5.solution(10,11), 11);
    }

    function test_sum_negative() public {
        // ceil(-10 + -10) / 2 = ceil(-20 / 2) = ceil(-10) = -10
        int256 avg_1 = level_5.solution(-10,-10);
        console.log(avg_1);
        assertEq(avg_1, -10);

        // ceil(-10 + -11) / 2 = ceil(-21 / 2) = ceil(-10.5) = -10
        // should not round up while negative
        assertEq(level_5.solution(-10,-11), -10);
    }

    function test_sum_mixed() public {
        // ceil(-10 + 10) / 2 = ceil(0 / 2) = ceil(0) = 0
        assertEq(level_5.solution(-10,10), 0);

        // ceil(-10 + 11) / 2 = ceil(1 / 2) = ceil(0.5) = 1
        assertEq(level_5.solution(-10,11), 1);
    }

    function test_sum_overflow() public {
        // ceil(0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF + 1) / 2 = ceil(0x80000000000000000000000000000000 / 2) = ceil(0x40000000000000000000000000000000) = 0x40000000000000000000000000000000
        int256 a = type(int256).max;
        int256 r = level_5.solution(a,a);
        assertEq(r, a);

    }
    
    function test_sum_neg_overflow() public {
        // ceil(0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF + 1) / 2 = ceil(0x80000000000000000000000000000000 / 2) = ceil(0x40000000000000000000000000000000) = 0x40000000000000000000000000000000
        int256 a = type(int256).min;
        int256 r = level_5.solution(a,a);
        assertEq(r, a);
    }

    function test_sum_neg_plus_positive_with_overflow() public {
        // ceil(0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF + 1) / 2 = ceil(0x80000000000000000000000000000000 / 2) = ceil(0x40000000000000000000000000000000) = 0x40000000000000000000000000000000
        int256 a = type(int256).min;
        int256 b = 2;
        int256 result = level_5.solution(a,b);
        console.log(result);
    }
}