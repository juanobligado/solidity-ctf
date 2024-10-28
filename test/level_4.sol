// stdin: 1                     stdout: 1 or 2**0
// stdin: 10                    stdout: 8 or 2**3
// stdin: 21                    stdout: 16 or 2**4
// stdin: 2048                  stdout: 2048 or 2**11
// stdin: 9223372036854775808   stdout: 9223372036854775808 or 2**63
// stdin: 0xffffffff            stdout: 2147483648 or 0x80000000 or 2**31
pragma solidity ^0.8.26;

import {Test, console} from "forge-std/Test.sol";
import {Level4} from "../src/level_4.sol";

contract Level4Test is Test {
    Level4 public level_4;

    function setUp() public {
        level_4 = new Level4();
    }

    function test_pow() public {
        uint256 number = 1;
        uint256 expected = 1;
        console.log(number);
        uint256 result = level_4.solution(number);
        assertEq(result, expected);

        number = 10;
        expected = 8;
                console.log(number);
        result = level_4.solution(number);
        assertEq(result, expected);

        number = 21;
        expected = 16;
        result = level_4.solution(number);
        assertEq(result, expected);

        number = 2048;
        expected = 2048;
        result = level_4.solution(number);
        assertEq(result, expected);

        number = 9223372036854775808;
        expected = 9223372036854775808;
        result = level_4.solution(number);
        assertEq(result, expected);

        number = 0xffffffff;
        expected = 2147483648;
        result = level_4.solution(number);
        assertEq(result, expected);
    }
}