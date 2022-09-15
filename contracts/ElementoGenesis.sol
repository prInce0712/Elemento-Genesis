//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract ElementoGenesis is ERC721 {
    using Strings for uint256;

    uint256 public immutable MAX_TOKEN = 10;
    address immutable I_OWNER;
    uint256 nextToken = 1;
    mapping(uint256 => string) tokenMetadata;

    constructor() ERC721("ElementoGenesis", "GENESIS") {
        I_OWNER = msg.sender;
    }

    function mint(uint256 tokenId, string memory metadata)
        public
        payable
        onlyOwner
        maxTokenRequired
    {
        string memory json = Base64.encode(bytes(metadata));
        string memory mintToken = string(
            abi.encodePacked("data:application/json;base64,", json)
        );
        tokenMetadata[tokenId] = mintToken;
        _safeMint(msg.sender, nextToken);
        nextToken++;
    }

    modifier onlyOwner() {
        require(msg.sender == I_OWNER, "you are not the owner");
        _;
    }

    modifier maxTokenRequired() {
        require(nextToken < MAX_TOKEN, "token is completely sold");
        _;
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override
        returns (string memory)
    {
        string memory finalToken = tokenMetadata[tokenId];

        return
            string(
                abi.encodePacked("data:application/json;base64,", finalToken)
            );
    }
}
