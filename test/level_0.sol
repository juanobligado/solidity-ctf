// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

import {Test, console} from "forge-std/Test.sol";
import {Level0} from "../src/level_0.sol";

contract CounterTest is Test {
    Level0 public level0;

    function setUp() public {
        level0 = new Level0();
    }

    function test_Increment() public {
        assertEq(level0.solution(),42);
    }

}
