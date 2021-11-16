// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
/// @title property listing and rental contract 
contract structMap {

    struct map1 {
        
        address owner;
        uint256 id;

        uint256 val1;
        uint256 val2;

    }
    
    
    struct map2 {
        
        address owner;
        uint256 id;
        
        address renter;

        uint256[] t1;
        uint256[] t2;
    
    }
    


    uint256 private ID;


    mapping(address => mapping (uint256 => map1)) public structure1;


    mapping(address => uint256[]) private listmapping;
    
    
    mapping(address => mapping (uint256 => map2)) private rentals;
    


    function setVal(uint256 val1, uint256 val2, uint256 id) public {
        
        require(id <= (listmapping[msg.sender].length - 1), "ID not found");

        structure1[msg.sender][id].val1 = val1;
        structure1[msg.sender][id].val2 = val2;

    }
    
    
    function newMap(uint256 val1, uint256 val2) public {
        
        ID = listmapping[msg.sender].length;
        
        structure1[msg.sender][ID].owner = msg.sender;
        structure1[msg.sender][ID].id = ID;
        
        structure1[msg.sender][ID].val1 = val1;
        structure1[msg.sender][ID].val2 = val2;
        
        listmapping[msg.sender].push(1);

    }



    function viewValListLength(address owner) public view returns (uint) {

        return listmapping[owner].length;

    }
    
    
    
     function Time_call() public view returns (uint256){
        return block.timestamp; 
    }
    
    
    function viewRentals(address owner, uint256 id, uint256 t1, uint256 t2) public view returns (uint256, uint256) {
    
            return (rentals[owner][id].t1[t1], rentals[owner][id].t2[t2]);
            
    }

        
    
    
    //// (EndA <= StartB or StartA >= EndB)
    
    
    uint256 private start;
    uint256 private end;
    
    
    function rent(address owner, uint256 id, uint256 t1, uint256 t2) public {
    
        require(id <= (listmapping[owner].length - 1), "ID not found");
        
        for (uint i=0; i<rentals[owner][id].t1.length; i++) {
            
            start = rentals[owner][id].t1[i];
            end = rentals[owner][id].t2[i];
        
            require((end <= t1 || start >= t2) == true);

        }
        
    
        rentals[owner][id].owner = owner;
        rentals[owner][id].id = id;
        
        rentals[owner][id].renter = msg.sender;
        
        
        rentals[owner][id].t1.push(t1);
        rentals[owner][id].t2.push(t2);
        

    }
    
    
    function addRentalTest(address owner, uint256 id, uint256 t1, uint256 t2) public {
        
        rentals[owner][id].t1.push(t1);
        rentals[owner][id].t2.push(t2);
    }
    

}