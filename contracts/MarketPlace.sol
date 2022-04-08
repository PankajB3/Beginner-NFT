// SPDX-License-Identifier:MIT

pragma solidity >=0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract MarketPlace {
    uint256 private counter = 0;

    // creating market data structure
    struct marketItem {
        uint256 id;
        uint256 tokenId;
        uint256 price;
        address nftToken;
        address payable creator;
        address payable buyer;
    }

    // mapping to track market items
    marketItem[] private marketIndex;

    // mapping(uint256 => marketItem) private marketIndex;

    constructor() {}

    function listMyNFT(
        address nftToken,
        uint256 tokenId,
        uint256 price
    ) external {
        marketIndex[counter] = marketItem(
            counter,
            tokenId,
            price,
            nftToken,
            payable(msg.sender),
            payable(address(0))
        );
        counter++;
        // providing apprioval to market place tyo sell my nft token.
        IERC721(nftToken).setApprovalForAll(address(this), true);
    }

    function buyNft(uint256 _tokenId) external payable {
        // require(_exists(_tokenId),"Token ID does not exist");
        marketItem memory m = exist(_tokenId);
        // require(m);
        (bool f, ) = m.creator.call{value: m.price}("");
        require(f, "Payment failed");
        IERC721(m.nftToken).transferFrom(m.creator, m.buyer, m.tokenId);
    }

    function exist(uint256 _tId) internal view returns (marketItem memory) {
        uint256 marketLen = marketIndex.length;
        for (uint256 i = 0; i < marketLen; i++) {
            marketItem memory m1 = marketIndex[i];
            uint256 nftToken = m1.tokenId;
            if (_tId == nftToken) {
                return m1;
            }
        }
    }
}
