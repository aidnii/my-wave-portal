// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

//kissing portal smart contract
contract kissingPortal {
    uint256 totalkisses;
    
    uint256 private seed;

    event NewKiss(address indexed from, uint256 timestamp, string message);

    struct Kiss {
        address kisser;
        string message;
        uint256 timestamp;
    }

    Kiss[] kisses;

    mapping(address => uint256) public lastKissedAt;

    constructor() payable {
        console.log("Hey there! Welcome to the Kissing Portal!");

        seed = (block.timestamp + block.difficulty) % 100;
    }

    function kiss(string memory _message) public {
        
        require(lastKissedAt[msg.sender] + 15 minutes < block.timestamp, "Wait 15 minutes");

        lastKissedAt[msg.sender] = block.timestamp;
        
        totalkisses += 1;
        console.log("Hey! %s has blown a kiss at you & sent a message!", msg.sender, _message);

        kisses.push(Kiss(msg.sender, _message, block.timestamp));

        seed = (block.difficulty + block.timestamp + seed) % 100;

        if (seed < 50) {
            console.log("%s won!", msg.sender);
            
            uint256 prizeAmount = 0.0001 ether;
            require(
                prizeAmount <= address(this).balance,
                "Trying to withdraw more money than the contract has."
            );
            (bool success, ) = (msg.sender).call{value: prizeAmount}("");
            require(success, "Failed to withdraw money from contract.");
        }

        emit NewKiss(msg.sender, block.timestamp, _message);
    }

    function getAllKisses() public view returns (Kiss[] memory) {
        return kisses;
    }

    function getTotalKisses() public view returns (uint256) {
        return totalkisses;
    }
}