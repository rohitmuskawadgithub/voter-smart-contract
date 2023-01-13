pragma solidity ^0.9.0;

contract Voter {
    address public owner;
    mapping(address => bool) public voters;
    uint public voteCount;

    constructor() public {
        owner = msg.sender;
    }

    function vote() public {
        require(!voters[msg.sender]);
        voters[msg.sender] = true;
        voteCount++;
    }

    function getVoteCount() public view returns (uint) {
        return voteCount;
    }

    function changeOwner(address newOwner) public {
        require(msg.sender == owner);
        owner = newOwner;
    }
}
