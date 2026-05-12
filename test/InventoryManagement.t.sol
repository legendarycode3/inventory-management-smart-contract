// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18; 

import "forge-std/Test.sol";
import {InventoryManagement} from "../src/InventoryManagement.sol";

contract InventoryManagementTest is Test {
    InventoryManagement inventorymanagement;
    

      /// @notice setUp function
    function setUp() public {
        inventorymanagement = new InventoryManagement();
    }



     function testAddInventoryItem() public {
            // ARRANGE
        uint256 itemId = 1;
        string memory name = "Melon";
        uint256 quantity = 4;
        uint256 price = 100;

            // ACT
        inventorymanagement.addInventoryItem(itemId, name, quantity, price); // adding items first 

            // ASSERT
        InventoryManagement.StockItem memory inventory = inventorymanagement.getInventoryItem(itemId);

        assertEq(inventory.name , "Melon", "Name mismatch");
        assertEq(inventory.quantity, quantity, "quantity mismatch");
        assertEq(inventory.price, 100, "price mismatch");
    }



     /// @notice getInventoryDetail test
    function testGetInventoryDetails() public {
            // ARRANGE 
        uint256 itemId = 2;
        string memory name = "Rice";
        uint256 quantity = 8;
        uint256 price = 360;
    
            // ACT
        // Adding Inventory first
        inventorymanagement.addInventoryItem(itemId, name, quantity, price); // adding Inventory first 

            // ASSERT
        InventoryManagement.StockItem memory inventory = inventorymanagement.getInventoryItem(itemId);

        assertEq(inventory.name , "Rice", "Name mismatch");
        assertEq(inventory.quantity, quantity, "quantity mismatch");
        assertEq(inventory.price, 360, "price mismatch");
      
    }

}