// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract kissingPortal {
    uint256 totalkisses;
    
    event newKiss(address indexed from, uint256 timestamp, string message);

    struct Kiss {
        address kisser;
        string message;
        uint256 timestamp;
    }

    constructor() {
        console.log("Hey there! Welcome to the Kissing Portal!");
    }

    function kiss() public {
        totalkisses += 1;
        console.log("Hey! %s has blown a kiss at you!", msg.sender);
    }

    function getTotalKisses() public view returns (uint256) {
        console.log("We have %d total kisses!", totalkisses);
        return totalkisses;
    }
}