// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Warning: This contract should be deployed by another contract, i.e TestTokenExecuter contract.
contract TestToken is ERC20, Ownable {
    constructor(address admin, uint256 initialAmount) ERC20("TestToken", "TEST"){
        _mint(admin, initialAmount);
    }

    function transferFromAdminTo(address to, uint256 amount) public onlyOwner {
        _transfer(tx.origin, to, amount);
    }
}