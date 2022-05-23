// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./TestToken.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TestTokenExecuter is Ownable {
    TestToken public token;
    constructor(uint256 initialAmount) {
        token = new TestToken(_msgSender(), initialAmount);
    }

    function getTokenAddress() public view returns(address){
        return address(token);
    }

    function transferFromAdminTo(address to, uint256 amount) public onlyOwner {
        token.transferFromAdminTo(to, amount);
    }

    function transferFromThisContractTo(address to, uint amount) public onlyOwner {
        token.transfer(to, amount);
    }
}