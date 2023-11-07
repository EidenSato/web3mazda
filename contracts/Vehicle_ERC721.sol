// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Erc721nft is ERC721, ERC721URIStorage, Ownable {
    constructor() ERC721("ERC721NFT", "ERC721")  Ownable(0xf872d368Ef2C9917B86BF5e63D521B00248B74cc){
        my_base_url = "https://eiden.tv/nft/";
    }

    string internal my_base_url;
    mapping (address => uint[]) internal _ownersHistory;
    
    function cng_my_base_url(string memory _my_base_url) public onlyOwner
    {
        my_base_url = _my_base_url;
    }

    function _baseURI() internal view override returns (string memory) {
        return my_base_url;
    }

    function safeMint(address to, uint256 tokenId, string memory uri)
        public
        onlyOwner
    {
        require(tokenId != 0);
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
        _ownersHistory[to].push(tokenId);
    }

    function ownersHistryLength(address adr) external view returns(uint256){
        return _ownersHistory[adr].length;
    }

    function ownersHistory(address adr,uint256 no) external view returns(uint256){
        require(no<_ownersHistory[adr].length);
        return _ownersHistory[adr][no];
    }

    // The following functions are overrides required by Solidity.

    function transferFrom(address from, address to, uint256 tokenId) public override(ERC721,IERC721) {    
        super.transferFrom(from,to,tokenId);
        _ownersHistory[to].push(tokenId);       
    }

//    function safeTransferFrom(address from, address to, uint256 tokenId) public override(ERC721) {
//        super.safeTransferFrom(from, to, tokenId);
//        _ownersHistory[to].push(tokenId); 
//    }

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) public override(ERC721,IERC721) {
        super.safeTransferFrom(from,to,tokenId,data);
        _ownersHistory[to].push(tokenId); 
    }

    //function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
    //    super._burn(tokenId);
    //}

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        //override(ERC721)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}