// SPDX-License-Identifier:MIT

pragma solidity >=0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract TinyVillage is ERC1155 {
    uint256 public constant VILLAGE = 0;
    uint256 public constant MINE = 1;
    uint256 public constant FARM = 2;
    uint256 public constant MILL = 3;
    uint256 public constant CASTLE = 4;

    constructor()
        ERC1155(
            "https://gateway.pinata.cloud/ipfs/QmTN32qBKYqnyvatqfnU8ra6cYUGNxpYziSddCatEmopLR/metadata/api/item/{id}.json"
        )
    {}

    function mintVillage() public {
        require(
            balanceOf(msg.sender, VILLAGE) == 0,
            "you already have a Village "
        );
        _mint(msg.sender, VILLAGE, 1, "0x000");
    }
}
