// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18; 


contract InventoryManagement {

        /** TYPE DECLARATIONS */
    /// @notice Struct to represent an inventory item, including properties such as item ID, name, quantity, and price.
    struct StockItem {
        uint256 itemId;
        string name;
        uint256 quantity;
        uint256 price;
    }


        /** STATE VARIABLES */
    /// @notice Mapping to store inventory items, using the item ID as the key and the struct as the value.
    mapping(uint256 => StockItem) public inventory;

    mapping(uint256 => bool) public itemExists;
    
    /// @notice Variable to store the address of the inventory manager.
    address public i_manager;
   

        /** ERRORS */
   /// @notice Custom error to handle unauthorized access to manager-only functions.
   error Not__Manager(address caller);
   error Invalid__Entries();
   error Not__ExistingItem(uint256 itemId);
   error Invalid__QuantityRange();


        /**MODIFIERS */
    /// @notice Modifier to restrict access to only the inventory manager.
    modifier onlyManager() {
        if (msg.sender != i_manager) {
            revert Not__Manager(msg.sender);
        }
        _;
    }


        /** FUNCTIONS */
    /// @notice A constructor that initializes the inventory manager (i_manager) to the address of the contract deployer.
    constructor () {
        i_manager = msg.sender;
    }

    function addInventoryItem(uint256 _itemId, string memory _name, uint256 _quantity, uint256 _price) public onlyManager {

            // CHECKS
        
        // check that ensure that the item ID is not Zero and that the quantity and price are positive values. This helps maintain the integrity of the inventory data and prevents invalid entries.
        if(_itemId == 0 || _quantity <= 0 || _price <= 0) {
            revert Invalid__Entries();
        }

            // EFFECTS (Updates/Sets state)
        if(inventory[_itemId].itemId != 0) {
            // if the item already exists, update the quantity and price of the existing item instead of creating a new entry.
            inventory[_itemId] = StockItem({
                itemId: _itemId,
                name: _name,
                quantity: inventory[_itemId].quantity + _quantity,
                price: inventory[_itemId].price = _price
            });
        } else {
            // if the item does not exist, create a new entry in the inventory mapping.
            inventory[_itemId] = StockItem({
                itemId: _itemId,
                name: _name,
                quantity: _quantity,
                price: _price 
            });
        }
    }


    /// @notice function updateInventoryItem() allows the inventory manager to update an existing item in the inventory.
    function updateInventoryItem( uint256 _itemId, string memory _newName, uint256 _newQuantity, uint256 _newPrice) public onlyManager {
        
                // CHECKS
        // checks to validate the input parameters, such as ensuring that the items to be updated already exists in the inventory and that the item ID is not zero and that the quantity and price are positive values. 
        if(_itemId == 0 || _newQuantity <= 0 || _newPrice <= 0) {
            revert Invalid__Entries();
        }

        // checks if the item to be updated already exists in the inventory, if it does not exist, it should revert with an appropriate error message.
       if(inventory[_itemId].itemId == 0) {
         revert  Not__ExistingItem(_itemId);
       }

                // EFFECTS (Updates/sets state)
        //studentRecords[_studentAdress].name = _newName;
        inventory[_itemId].itemId = _itemId;
        inventory[_itemId].name = _newName;
        inventory[_itemId].quantity = _newQuantity;
        inventory[_itemId].price = _newPrice;                  
    }



    // @notice function removeInventoryItem() allows the inventory manager to remove an existing item from the inventory.
    function removeInventoryItem(uint256 _itemId) public onlyManager {
            // CHECKS
        // checks if the item to be removed already exists in the inventory, if it does not exist, it should revert.
        if(inventory[_itemId].itemId == 0){
            revert Invalid__Entries();
        }

        if(!itemExists[_itemId]) {
            revert Not__ExistingItem(_itemId);
        }

            // EFFECTS
        delete inventory[_itemId];
        delete itemExists[_itemId]; // Marks as removed
    }


    /// @notice function shipInventoryItem() that allows inventory manager to ship a requested inventoryItem to the customers in need.
    function shipInventoryItem(uint256 _itemId, uint256 _quantity) public onlyManager {
            // CHECKS
        // checks if the item to be shipped already exists in the inventory, if it does not exist, it should revert.
        if(inventory[_itemId].itemId == 0) {
            revert Not__ExistingItem(_itemId);
        }

        // Checks if the quantity to be shipped is less than or equal to the available quantity in the inventory. If not, it should revert with an appropriate error message.
        if(_quantity > inventory[_itemId].quantity) {
            revert Invalid__QuantityRange();
        }

                // EFFECT
        inventory[_itemId].quantity -= _quantity;
    }


    /// @notice function getInventoryItem() allows anyone to retrieve the details of a specific inventory item by its ID.
    function getInventoryItem(uint256 _itemId) public view returns (StockItem memory) {
        return inventory[_itemId];
    }


}























