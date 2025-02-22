// SPDX-License-Identifier: MIT

/*
 * Created by Satoshi Nakajima (@snakajima)
 */

pragma solidity ^0.8.6;

import "@openzeppelin/contracts/utils/Strings.sol";
import './libs/ProviderToken.sol';

contract SampleToken is ProviderToken {
  using Strings for uint256;

  constructor(
    IAssetProvider _assetProvider,
    IProxyRegistry _proxyRegistry
  ) ProviderToken(_assetProvider, _proxyRegistry, "Sample", "SAMPLE") {
    description = "This is a part of Fully On-chain Generative Art project (https://fullyonchain.xyz/).";
    mintPrice = 0;
    mintLimit = 250;
  }

  function tokenName(uint256 _tokenId) internal pure override returns(string memory) {
    return string(abi.encodePacked('Sample ', _tokenId.toString()));
  }

  function mint() public override virtual payable returns(uint256 tokenId) {
    tokenId = super.mint();
  }
}
