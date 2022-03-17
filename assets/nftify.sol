// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.0;

import "github.com/OpenZeppelin/openzeppelin-contracts/contracts/utils/Counters.sol";
import "github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol"; 

contract NFTify is ERC721URIStorage {

  using Counters for Counters.Counter;
  Counters.Counter private tokenIds; 
  
  constructor() ERC721("NFTify", "NFY") { }
  
  function mintNFT(string memory tokenURI) public returns (uint) { 
    
    tokenIds.increment();
    uint256 newItemId = tokenIds.current();
      
    _mint(msg.sender, newItemId);
    _setTokenURI(newItemId, tokenURI);
    
    return newItemId;
    
  }

  function currentID() public view returns (uint) {
    return tokenIds.current();
  }
  
}
