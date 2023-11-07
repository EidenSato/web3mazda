// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Erc1155nft is ERC1155, Ownable {

    string _base_uri = "https://eiden.tv/nft/";
    mapping (uint => string ) internal _filename;

    constructor()
        ERC1155("") Ownable(0xf872d368Ef2C9917B86BF5e63D521B00248B74cc)
    {}

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data,string memory filename)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
        _filename[id]=filename;
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data,string[] memory filename)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
        for(uint i=0;i<ids.length;i++){
            _filename[ids[i]] = filename[i];
        }
    }

    function uri(uint256 _tokenid) override public view returns (string memory) {
        return string(
            abi.encodePacked(
                _base_uri,
                _filename[_tokenid]
            )
        );
    }
}