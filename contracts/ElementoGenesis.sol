
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract ElementoGenesis is ERC721 {
    constructor() ERC721("ElementoGenesis", "GENESIS") {
        
    }
}