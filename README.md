# Inventory Management Smart Contract

## Project Overview

## 📌 Features

## 🧠 Key Concepts Applied
* ****Modifier:**** Access-Control for onlyManager of the inventory system to access the details.
* ****Struct:****
* ****Mapping:**** For tracking of inventory details and also checking an existing items using the itemId (if available).
* ****Data types:**** Defines the exact nature of data to be stored, ensuring the blockchain knows how to handle, compute, and store it efficiently.
* ****Constructor:**** Sets the address that deploys the contract as the manager.
* ****Custom Error:**** Defined and used custom errors implementations, for gas optimation.

## 📂 Project Structure (Files)
* ****`InventoryManagement.sol`****: The main source file contract implementing `addInventoryItem`, `updateInventoryItem`, `removeInventoryItem`, `shipInventoryItem` and `getInventoryItem` functions.
* ****`InventoryManagement.t.sol`****: Unit Test (suite) containing tests to validate contract functionalities.

## 🌐Technology Stack (Technologies Used)
* ****[Solidity](https://www.soliditylang.org/)**** - The programming language for writing the Smart contracts.
* ****[Remix IDE](https://remix.ethereum.org/)**** - used it to write, and deploy the smart contract directly in the browser first. A fastest way to get started, acting as a "no-setup" workshop for smart contract development.
* ****[Foundry(forge, cast, anvil)](https://www.getfoundry.sh/)**** - Development framework and testing suite.
* ****[Visual Studio Code](https://code.visualstudio.com/)****  - Install this IDE only if you are using foundry development kit rather than "Remix IDE" which is for quick prototying.

## Getting Started

### Prerequisites
* Solidity Compiler, Version ^0.8.19 or higher.
* `Remix IDE` or `Foundry Development Kit`

### Recommendation (For Beginners)
****NOTE (Use Remix IDE, for quick prototyping):****  You can literally just copy the main contract source code and paste it on Remix IDE and learn along side how the code works while trying to build yours as you keep building. 

### Building the Project (Using Remix IDE):
1. Copy the core smart contract file code `InventoryManagement.sol` to Remix IDE (a browser based IDE, for quick prototyping).
2. Create a new file for the project on your Remix IDE and paste , to learn and build along faster.
3.  And then Compile the smart contract file you have created on Remix IDE.

### Building the Project (Using Foundry Development Kit ) - only if you are good using foundry kit & Vscode
1. Clone the repository:
   ```shell
    git clone https://github.com/legendarycode3/inventory-management-smart-contract
   ```
2.  Navigate to the directory you created and cloned the file to:
    ```shell
      cd inventory-management-smart-contract
    ```
3. Compile the smart contract:
   `forge build`

### Testing the contract (Using Foundry Development Kit ) 
Runing all tests:
   ```shell
    forge test
  ```
Runing specific test:
 ```shell
     forge test --mt testFunctionName
  ```

## Usage

## 📋Contract Details
### Functions:
* ****`addInventoryItem`****: Function that allows only the  inventory manager, to add a new stock item, to the inventory system.
* ****`updateInventoryItem`****:  Function that allows the only inventory manager to update an existing item in the inventory (only if it exist).
* ****`removeInventoryItem(uint256)`****: Function that  allows only the inventory manager to remove an existing item from the inventory.
* ****`shipInventoryItem*(uint256, uint256)`****: Function that allows only the inventory manager to ship / sale a requested inventoryItem to the customers in need.
* ****`getInventoryItem(uint256)`****:  Function allows to retrieve the details of a specific inventory item by its ID.

### Variables:

## Usage Guide (How to use - When using Remix IDE)

## Why This Matters (Inventory Management Smart Contract)

## Security Considerations

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of (Some include):

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).

## Documentation

https://book.getfoundry.sh/

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

## Author
Built with ❤️ by [@legendarycode3](https://github.com/legendarycode3/)  </br>
Part of my  `60 Days of Solidity Challenge`

##  If you find this project helpful, please give it a star and link back to this repository. 
`I Appreciate`
