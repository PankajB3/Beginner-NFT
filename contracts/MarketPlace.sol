// SPDX-License-Identifier:MIT

pragma solidity >=0.8.0;

contract MarketPlace {
    uint256 private counter = 0;

    // creating market data structure
    struct marketItem{
        uint256 id;
        uint256 tokenId;
        uint256 price;
        address nftToken;
        address payable creator;
        address payable buyer;
    }

    // mapping to track market items
    mapping(uint256 => marketItem) private marketIndex;

    function listMyNFT(address nftToken, uint256 tokenId, uint256 price) external{
        marketIndex[counter] = marketItem(
            counter,
            tokenId,
            price,
            nftToken,
            payable(msg.sender),
            payable(address(0))
        )
    }

    function buyNft(uint256 _tokenId) external{
        require();
    }

}