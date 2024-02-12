// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.2;

import "./ElectionManager.sol";

contract Voting is ElectionManager {
    struct Voter {
        bool authorized;
        bool voted;
        uint256 vote;
    }

    struct Candidate {
        uint256 id;
        string name;
        string description;
        string imageIPFSHash; // IPFS hash for the image
        uint256 voteCount;
    }

    mapping(address => Voter) public voters;
    Candidate[] public candidates;
    uint256 public totalVotes;

    modifier onlyRegisteredVoter() {
        require(voters[msg.sender].authorized, "You are not authorized to vote.");
        _;
    }

    function vote(uint256 candidateId) public onlyRegisteredVoter electionInProgress {
        require(!voters[msg.sender].voted, "You have already voted.");
        require(candidateId < candidates.length, "Invalid candidate.");

        // Mark voter as already voted and register vote
        voters[msg.sender].voted = true;
        voters[msg.sender].vote = candidateId;

        // Increment selected candidate vote count and total votes
        candidates[candidateId].voteCount += 1;
        totalVotes += 1;
    }

    function authorizeVoter(address _voter) public onlyOwner {
        require(!voters[_voter].voted, "Voter has already voted.");
        require(!voters[_voter].authorized, "Voter is already authorized.");
        voters[_voter].authorized = true;
    }
}
