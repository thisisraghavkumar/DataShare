pragma solidity >=0.4.0 <0.7.0;

contract User{
    address owner;
    string name;
    uint8 uid;
    bytes32 image;
    
    struct file{
        bytes32 ipfshash;
        string desc;
        uint8 owner;
        uint16 price;
    }
    
    file[] uploaded;
    uint8 numUploaded;
    file[] downloaded;
    uint8 numDownloaded;
    
    constructor(address oadd, string memory n, uint8 u, bytes32 ihash) public{
        owner = oadd;
        name = n;
        uid = u;
        image = ihash;
        numUploaded=0;
        numDownloaded=0;
    }
    
    function getUploadedFileNums() public view returns(uint8){
        return numUploaded;
    }
    
    function getDownloadedFileNums() public view returns(uint8){
        require(msg.sender==owner);
        return numDownloaded; 
    }
    
    function getUploadedFile(uint8 index) public view returns(bytes32, string memory, uint8, uint16){
        require(index < numUploaded);
        file memory fl = uploaded[index];
        return (fl.ipfshash, fl.desc, fl.owner, fl.price);
    }
    
    function getDownloadedFiles(uint8 index) public view returns(bytes32, string memory, uint8, uint16) {
        require(index < numDownloaded);
        require(msg.sender==owner);
        file memory fl = downloaded[index];
        return(fl.ipfshash, fl.desc, fl.owner, fl.price);
    }
    
    function uploadFile(bytes32 iphash, string memory desc, uint8 ownerID, uint16 price) public returns(bool) {
        require(msg.sender==owner);
        uploaded.push(file(iphash, desc, ownerID, price));
    }
    
    function updatePrice(uint8 num, uint16 new_price) public{
        require(msg.sender==owner);
        require(num < numUploaded);
        uploaded[num].price = new_price;
    }
    
}