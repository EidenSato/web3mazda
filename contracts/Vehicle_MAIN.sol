// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface Erc1155nft {
    function safeTransferFrom(address from, address to, uint256 id, uint256 value, bytes memory data) external;
}

contract hasomzVehicle{
    //owner
    address public owner;
    modifier onlyOwner {
        require (msg.sender == owner);
        _;
    }
    function isOwner() public view returns(bool) {
        return msg.sender == owner;
    }
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0),"The address must be non-zero");
        owner = newOwner;
    }

    //approve
    mapping(address operator => bool) internal _operatorApprovals;
    function approve(address to) external onlyOwner {
        _operatorApprovals[to]=true;
    }
    function isApproved(address operator) public view returns (bool) {
        return _operatorApprovals[operator];
    }

    //constructor
    constructor(){
        owner = msg.sender;
    }

    //main 
    mapping (address => uint[] ) internal vehicleInfo;
    event addVInfo(address _adr,uint _num);
    event delVInfo(address _adr,uint _num);

    function addVehicleInfo(address _adr,uint _num) external{
        require(isApproved(msg.sender) || isOwner(),"You are not authorized to operate.");
        require(_num != 0,"Vehicle number must be non-zero.");
        vehicleInfo[_adr].push(_num);
        emit addVInfo(_adr,_num);
    }

    function delVehicleInfo(address _adr,uint _num) external{
        require(isApproved(msg.sender) || isOwner(),"You are not authorized to operate.");
        require(_num != 0,"Vehicle number must be non-zero.");
        require(isVehicleInfo(_adr,_num)==true,"Vehicle number does not exist.");
        uint n = vehicleInfo[_adr].length;
        bool flag = false;
        for (uint i=0;i<n;i++){
            if(vehicleInfo[_adr][i]==_num){
                vehicleInfo[_adr][i]=0;
                flag = true;
            }
        }
        assert(flag);
        emit delVInfo(_adr,_num);
    }

    function cngVehicleInfo(address _fromAdr,address _toAdr,uint _num) external{
        require(isApproved(msg.sender) || isOwner(),"You are not authorized to operate.");
        require(_num != 0,"Vehicle number must be non-zero.");
        require(isVehicleInfo(_fromAdr,_num)==true,"Vehicle number does not exist.");
        uint n = vehicleInfo[_fromAdr].length;
        bool flag = false;
        for (uint i=0;i<n;i++){
            if(vehicleInfo[_fromAdr][i]==_num){
                vehicleInfo[_fromAdr][i]=0;
                flag = true;
            }
        }
        assert(flag);
        vehicleInfo[_toAdr].push(_num);
        emit addVInfo(_toAdr,_num);
    }

    function lengthVehicleInfo(address _adr) external view returns(uint){
        return vehicleInfo[_adr].length;
    }

    function readVehicleInfo(address _adr,uint _no) external view returns(uint){
        return vehicleInfo[_adr][_no];
    }

    function isVehicleInfo(address _adr,uint _num) public view returns(bool) {
        require(_num != 0,"Vehicle number must be non-zero.");
        bool chk=false;
        uint n = vehicleInfo[_adr].length;
        for (uint i=0;i<n;i++){
            if(vehicleInfo[_adr][i]==_num){
                chk = true;
            }
        }
        return chk;
    }
}

contract hasomzMaintenance {
    //owner
    address public owner;
    modifier onlyOwner {
        require (msg.sender == owner);
        _;
    }
    function isOwner() public view returns(bool) {
        return msg.sender == owner;
    }
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0),"The address must be non-zero");
        owner = newOwner;
    }

    //approve
    mapping(address operator => mapping(uint id => bool)) internal _operatorApprovals;
    function approve(address to,uint id) external onlyOwner {
        _operatorApprovals[to][id]=true;
    }
    function isApproved(address operator,uint idNFT) public view returns (bool) {
        return _operatorApprovals[operator][idNFT];
    }
    //constructor
    constructor(address vInfoContAdr,address nftContAdr,address nftHoldAdr) {
        owner = msg.sender;
        _vInfoContAdr = vInfoContAdr;
        _nftContAdr = nftContAdr;
        _nftHoldAdr = nftHoldAdr;
    }

    //main
    address internal _vInfoContAdr;
    address internal _nftContAdr;
    address internal _nftHoldAdr;

    event addMInfo(uint _num);

    struct maintenanceInfo {
        uint nftId;
        uint dateTime;
    }
    mapping(uint => maintenanceInfo[]) internal maintinfos;
    struct userInfo {
        uint nftId;
        uint dateTime;
    }
    mapping(address => userInfo[]) internal userinfos;

    function addMaintenanceInfo(uint _num,address _toAdr,uint _idNFT) external{
        require(isApproved(msg.sender,_idNFT) || isOwner(),"You are not authorized to operate.");
        require(_num != 0,"Vehicle number must be non-zero.");
        require(_toAdr != address(0),"The address must be non-zero");
        hasomzVehicle vInfo = hasomzVehicle(_vInfoContAdr);
        require(vInfo.isVehicleInfo(_toAdr,_num) == true,"The vehicle corresponding to that address and number is not registered.");
        //nft
        Erc1155nft(_nftContAdr).safeTransferFrom(_nftHoldAdr,_toAdr,_idNFT,1,"");
        //Maint
        uint _plen = maintinfos[_num].length;
        maintenanceInfo memory _maintinfo;
        _maintinfo.nftId = _idNFT;
        _maintinfo.dateTime = block.timestamp;
        maintinfos[_num].push(_maintinfo);
        assert(maintinfos[_num].length == (_plen + 1));
        //User
        uint _plen2 = userinfos[_toAdr].length;
        userInfo memory _userinfo;
        _userinfo.nftId = _idNFT;
        _userinfo.dateTime = block.timestamp;
        userinfos[_toAdr].push(_userinfo);
        assert(userinfos[_toAdr].length == (_plen2 + 1));
        //
        emit addMInfo(_num);
    }
    
    function nftContructAddress() external view returns(address){
        return _nftContAdr;
    }

    function lengthMaintenanceInfo(uint _num) external view returns(uint){
        return maintinfos[_num].length;
    }

    function readMaintenanceInfo(uint _num,uint _no) external view returns(uint,uint){
        return (
            maintinfos[_num][_no].nftId,
            maintinfos[_num][_no].dateTime
        );
    }

    function lengthUserInfo(address _adr) external view returns(uint){
        return userinfos[_adr].length;
    }

    function readUserInfo(address _adr,uint _no) external view returns(uint,uint){
        return (
            userinfos[_adr][_no].nftId,
            userinfos[_adr][_no].dateTime
        );
    }
}
