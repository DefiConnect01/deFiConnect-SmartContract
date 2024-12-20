// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;
import {Script} from "forge-std/Script.sol";
import { VeDist} from "../src/base/vote/VeDist.sol";
import {BribeFactory } from "../src/base/reward/BribeFactory.sol";
import { GaugeFactory} from "../src/base/reward/GaugeFactory.sol";
contract DeployRewards is Script {
    BribeFactory bribeFactory;
    GaugeFactory gaugeFactory;
    VeDist veDist;
    address ESCROW = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;

    function run() public returns ( BribeFactory,GaugeFactory,VeDist) {
         vm.startBroadcast();
         veDist= new VeDist(ESCROW);
         bribeFactory = new BribeFactory();
         gaugeFactory = new GaugeFactory();
        
         vm.stopBroadcast();
         return (bribeFactory, gaugeFactory, veDist);
    }
}