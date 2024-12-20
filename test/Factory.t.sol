// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;
import {Test, console} from "forge-std/Test.sol";
import {Script} from "forge-std/Script.sol";
import { DeFiConnectFactory} from "../src/base/core/deFiConnectFactory.sol";
import { DeFiConnectToken} from "../src//base/token/DeFiConnect.sol";
import { DeFiconnectRouter01} from "../src/base/periphery/deFiConnectRouter.sol";
import { DeFiconnectPair} from "../src/base/core/deFiconnectPair.sol";

// import {WETH} from "./weth.sol";

contract DexTest is Test, Script{
    DeFiConnectFactory factory;
    DeFiConnectToken tokenA;
    DeFiConnectToken tokenB;
    DeFiconnectRouter01 router;
    DeFiconnectPair pair;
    address weth = 0x5FbDB2315678afecb367f032d93F642f64180aa3; 
    address TREATURY_ADDRESS = makeAddr("Treasury");
    address LP_USER = makeAddr("LP_USER");
    

    function setUp() external {
      tokenA = new DeFiConnectToken();
      tokenB = new DeFiConnectToken();
      
      factory = new DeFiConnectFactory(TREATURY_ADDRESS);
      router = new DeFiconnectRouter01(address(factory), weth);

    //  pair = new DeFiconnectPair();
      vm.startPrank(address(this));
      tokenA.mint(LP_USER, 10000e18);
      tokenB.mint(LP_USER, 10000e18);
      vm.stopPrank();

      vm.startPrank(LP_USER);
      tokenA.approve(address(router), type(uint256).max);
      tokenB.approve(address(router), type(uint256).max);
      vm.stopPrank();

     
        
    }

    function testCreatePair() external {
       vm.prank(msg.sender);
       factory.createPair(address(tokenA), address(tokenB), true); 
       assert(factory.allPairsLength() == 1);
       //testing for Revert  
       vm.expectRevert();
       vm.prank(msg.sender);
       factory.createPair(address(tokenA), address(tokenA), true); 
       assert(factory.allPairsLength() == 1); 
    }

    function testAddLiquidity() external {
      uint256 ContractBlanaceBeforeTokenA = tokenA.balanceOf(address(router));
      uint256 ContractBlanaceBeforeTokenB = tokenB.balanceOf(address(router));
      console.log("TokenA Balance Before", ContractBlanaceBeforeTokenA);
      console.log("TokenB Balance Before", ContractBlanaceBeforeTokenB);

      vm.startPrank(LP_USER);
      router.addLiquidity(
        address(tokenA),
        address(tokenB),
        true,
        1000e18,
        1000e18,
        10e18,
        10e18,
        address(router),
        block.timestamp + 15 minutes

      );
      vm.stopPrank();
      uint256 ContractBlanaceAfterTokenA = tokenA.balanceOf(address(router));
      uint256 ContractBlanaceAfterTokenB = tokenB.balanceOf(address(router));
      console.log("TokenA Balance After", ContractBlanaceAfterTokenA);
      console.log("TokenB Balance After", ContractBlanaceAfterTokenB);

    }

}