// SPDX-License-Identifier:MIT

pragma solidity >=0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract QuoteNFT is ERC721 {
    uint256 private _tokenId = 0;
    string private name;
    string private symbol;
    address private owner;

    modifier onlyOwner(address user) {
        require(user == owner, "Only Owner can call");
        _;
    }

    constructor(string memory name_, string memory symbol_)
        ERC721("QuoteNFT", "QNFT")
    {
        name = name_;
        symbol = symbol_;
        owner = msg.sender;
    }

    function mint() public onlyOwner(msg.sender) {
        _mint(msg.sender, _tokenId);
        _tokenId++;
    }

    // https://ipfs.io/ipfs/Qmba8o49D2ycRRUNVPdVBgtkF4XiBRAKQ1e4eqJTUHWMrb?filename=NFT1.png
    // method overriden to provide my NFT sharable link as baseURI
    function _baseURI()
        internal
        view
        override
        onlyOwner(msg.sender)
        returns (string memory)
    {
        // string memory baseIPFS = "https://ipfs.io/ipfs/";
        // string memory URI = string(abi.encodePacked(baseIPFS, baseExtension));
        // return baseExtension;
        return "https://ipfs.io/ipfs/Qmba8o49D2ycRRUNVPdVBgtkF4XiBRAKQ1e4eqJTUHWMrb?filename=NFT1.png";
    }

    function getCurrentTokenId() external view returns (uint256) {
        return _tokenId;
    }
}
