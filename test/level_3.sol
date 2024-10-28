// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

import {Test, console} from "forge-std/Test.sol";
import {Level3} from "../src/level_3.sol";

contract LevelTest is Test {
    Level3 public level_3;

    function setUp() public {
        level_3 = new Level3();
    }


    function test_encode() public {
        uint16 a = 12000;
        bool b = true;
        bytes6 c = 0x010203040506;
        bytes memory packed = abi.encodePacked(a, b, c);
        // Log the packed bytes
        (uint16 a_,bool b_, bytes6 c_) = level_3.solution(packed);
        console.log(a_);
        console.log(b_);
        console.logBytes6(c_);
        assertEq(a, a_);
        assertEq(b_, b);
        assertEq(c_, c);

    }

    function test_encode_false() public {
        uint16 a = 12000;
        bool b = false;
        bytes6 c = 0x010203040506;
        bytes memory packed = abi.encodePacked(a, b, c);
        // Log the packed bytes
        (uint16 a_,bool b_, bytes6 c_) = level_3.solution(packed);
        console.log(a_);
        console.log(b_);
        console.logBytes6(c_);
        assertEq(a, a_);
        assertEq(b_, b);
        assertEq(c_, c);

    }

    function test_with_fuzz(uint16 a, bool b, bytes6 c) public {
        bytes memory packed = abi.encodePacked(a, b, c);
        // Log the packed bytes
        console.logBytes(packed);
        console.log(a);
        console.log(b);
        console.logBytes6(c);
        (uint16 a_,bool b_, bytes6 c_) = level_3.solution(packed);
        console.log(a_);
        console.log(b_);
        console.logBytes6(c_);
        assertEq(a_, uint16(a));
        assertEq(b_, b);
        assertEq(c_, c);
    }


}