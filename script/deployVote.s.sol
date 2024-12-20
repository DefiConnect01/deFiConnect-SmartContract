// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;
import {Script} from "forge-std/Script.sol";
import {Ve} from "../src/base/vote/Ve.sol";
import {DystMinter} from "../src/base/token/DystMinter.sol";
import {DystVoter} from "../src/base/vote/DystVoter.sol";

contract DeployVotes is Script {
     Ve ve;
    // DeFiConnectToken token;
    DystMinter minter;
    DystVoter voter;
    address TOKEN= 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512;
    address CONTROLLER = 
    address FACTORY = 
    address GUAGEFACTORY=0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0
    address BRIBEFACTORY = 0x5FbDB2315678afecb367f032d93F642f64180aa3

    function run() public returns(Ve,DystMinter,DystVoter) {
         vm.startBroadcast();
          ve = new Ve(
            // address(token),
            TOKEN,
             CONTROLLER
            // address(controller)

         );

         minter = new DystMinter(
            address(ve),
            CONTROLLER,
            // address(controller),
            2

         );
          voter= new DystVoter(
            address(ve),
             FACTORY,
             GUAGEFACTORY,
              BRIBEFACTORY
            // address(factory),
            // address(gaugeFactory),
            // address( bribeFactory)
          );
         vm.stopBroadcast();

         return (ve, minter, voter);
    }
}