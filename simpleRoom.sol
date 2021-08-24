pragma solidity ^0.5.0;

contract Hospital{
	struct Room{
    	//complete the struct
    	bytes32 room_name;
    	string occupant_name;
    	bool is_free;
	}
	Room[] public rooms;
    
	constructor (bytes32[] memory names) public{
    	//complete the constructor
    	for(uint i=0;i<names.length;i++){
    	    rooms.push(Room(
    	        {
    	           room_name : names[i],
    	           occupant_name : "none",
    	           is_free : true
    	        }));
    	}
    	}

	function assignRoom(bytes32 roomName, string memory patientName) public returns(string memory){
	    
    	//complete the function
    	for(uint i=0;i<rooms.length;i++){
    	    if(rooms[i].room_name == roomName){
    	        if(rooms[i].is_free == true){
    	            rooms[i].occupant_name = patientName;
    	            rooms[i].is_free = false;
    	            return "assigned";
    	        }else {
    	            return "room occupied";
    	        }
    	    }
    	}
           	 	
    	}
}
