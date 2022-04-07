// SPDX-License-Identifier:MIT

pragma solidity >=0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract QuoteNFT is ERC721URIStorage {
    uint256 private _tokenId = 0;
    string private name;
    string private symbol;
    address private owner;
    string private baseExtension;

    modifier onlyOwner(address user) {
        require(user == owner, "Only Owner can call");
        _;
    }

    // give base extension without baseUri
    constructor(
        string memory name_,
        string memory symbol_,
        string memory _baseExtension
    ) ERC721(name_, symbol_) {
        name = name_;
        symbol = symbol_;
        owner = msg.sender;
        baseExtension = _baseExtension;
    }

    function mint() public onlyOwner(msg.sender) {
        _mint(msg.sender, _tokenId);
        _setTokenURI(_tokenId, baseExtension);
        tokenURI(_tokenId);
        _tokenId++;
    }

    // https://ipfs.io/ipfs/Qmba8o49D2ycRRUNVPdVBgtkF4XiBRAKQ1e4eqJTUHWMrb?filename=NFT1.png
    // method overriden to provide my NFT sharable link as baseURI
    function _baseURI() internal view virtual override returns (string memory) {
        string memory baseIPFS = "https://ipfs.io/ipfs/";
        // string memory URI = string(abi.encodePacked(baseIPFS, baseExtension));
        return baseIPFS;
        // return "https://ipfs.io/ipfs/Qmba8o49D2ycRRUNVPdVBgtkF4XiBRAKQ1e4eqJTUHWMrb?filename=NFT1.png";
    }

    function getCurrentTokenId() external view returns (uint256) {
        return _tokenId;
    }
}
