pragma solidity ^0.5.0;

contract Election{
    
    mapping (bytes32 => uint) public votecount;
    
    bytes32[] public candidates;
    
    constructor(bytes32[] memory candidate_name) public{
        // takes names of candidates as input and stores them
        candidates = candidate_name;
    }
    
    function getTotalVotes(bytes32 candidate) public view returns(uint){
        // to return total votes for candidate with name as input
        return votecount[candidate];
        
    }
    
    function castVote(bytes32 candidate) public{
        // function to cast vote for candidate with name as input
        votecount[candidate] += 1;
    }
    
    modifier validity(bytes32 candidate){
        require(checkValidity(candidate));
        _;
    }
    
    function checkValidity(bytes32 candidate) internal view returns(bool){
        for(uint i=0;i<candidates.length;i++){
            if(candidates[i] == candidate){
                return true;
            }
        }
        return false;
    }
}
