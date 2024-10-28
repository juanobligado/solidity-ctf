// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Level0} from "../src/level_0.sol";

contract Level0Script is Script {
    Level0 public level0;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        level0 = new Level0();

        vm.stopBroadcast();
    }
}
