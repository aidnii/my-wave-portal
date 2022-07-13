// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

//kissing portal smart contract
contract kissingPortal {
    uint256 totalkisses;
    
    event NewKiss(address indexed from, uint256 timestamp, string message);

    struct Kiss {
        address kisser;
        string message;
        uint256 timestamp;
    }

    Kiss[] kisses;

    constructor() {
        console.log("Hey there! Welcome to the Kissing Portal!");
    }

    function kiss(string memory _message) public {
        totalkisses += 1;
        console.log("Hey! %s has blown a kiss at you & sent a message!", msg.sender, _message);

        kisses.push(Kiss(msg.sender, _message, block.timestamp));
        emit NewKiss(msg.sender, block.timestamp, _message);
    }

    function getAllKisses() public view returns (Kiss[] memory) {
        return kisses;
    }

    function getTotalKisses() public view returns (uint256) {
        console.log("We have %d total kisses!", totalkisses);
        return totalkisses;
    }
}