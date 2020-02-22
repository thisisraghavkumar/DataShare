pragma solidity >=0.4.0 <0.7.0;

contract auditor{
    struct point{
        string name;
        uint8 uid;
        address contractAddress;
        bool isValue;
    }
    
    mapping (address => point) user_map;
    address[] users;
    
    uint8 public numPeople;
    
    constructor() public{
        numPeople=0;
    }
    
    function addUser(string memory nm, address ca) public returns(uint8){
        if(user_map[msg.sender].isValue == false){
            return 0;
        }
        user_map[msg.sender] = point(nm, numPeople, ca, true);
        users.push(msg.sender);
        numPeople = numPeople + 1;
        return 1;
    }
    
    function getUser(uint8 unum) public view returns(string memory, uint8, address){
        require(unum < numPeople);
        require(user_map[users[unum]].isValue);
        point memory p = user_map[users[unum]];
        return(p.name, p.uid, p.contractAddress);
    }
    
    function getNumpeople() public view returns(uint8){
        return numPeople;
    }
}