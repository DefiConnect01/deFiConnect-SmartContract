// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;
import {Script} from "forge-std/Script.sol";
import {DeFiConnectFactory} from "../src/base/core/deFiConnectFactory.sol";
import {DeFiconnectRouter01} from "../src/base/periphery/deFiConnectRouter.sol";
import { Controller} from "../src/Controller.sol";
// import {Ve} from "../src/base/vote/Ve.sol";
// import {DeFiConnectToken} from "../src/base/token/DeFiConnect.sol";
// import {DystMinter} from "../src/base/token/DystMinter.sol";
// import { VeDist} from "../src/base/vote/VeDist.sol";
// import {BribeFactory } from "../src/base/reward/BribeFactory.sol";
// import { GaugeFactory} from "../src/base/reward/GaugeFactory.sol";
// import {DystVoter} from "../src/base/vote/DystVoter.sol";
contract DeployDex is Script {
    DeFiConnectFactory factory;
    DeFiconnectRouter01 router;
    Controller controller;
   //  Ve ve;
    // DeFiConnectToken token;
   //  DystMinter minter;
   //  VeDist veDist;
   //  BribeFactory bribeFactory;
   //  GaugeFactory gaugeFactory;
   //  DystVoter voter;

  
    address TREATURY_ADDRESS = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8;
   //  address ESCROW = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
   //  address TOKEN= 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512;
     address weth = 0x5FbDB2315678afecb367f032d93F642f64180aa3;
     
    function run() public returns( DeFiConnectFactory,DeFiconnectRouter01,Controller) {
    
    vm.startBroadcast();
        factory = new DeFiConnectFactory(TREATURY_ADDRESS);
         router = new  DeFiconnectRouter01(address(factory), weth);
        //  token = new DeFiConnectToken();
         controller = new  Controller();
         // ve = new Ve(
         //    // address(token),
         //    TOKEN,
         //    address(controller)

         // );

         // minter = new DystMinter(
         //    address(ve),
         //    address(controller),
         //    2

         // ); 
         // veDist= new  VeDist(ESCROW);
         //  bribeFactory = new BribeFactory();
         //  gaugeFactory = new  GaugeFactory();
         //  voter= new DystVoter(
         //    address(ve),
         //    address(factory),
         //    address(gaugeFactory),
         //    address( bribeFactory)
         //  );

     vm.stopBroadcast();

     return (factory,router,controller);
    }


}