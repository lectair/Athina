// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.2;

import "./ElectionManager.sol";

contract CandidateRegistry is ElectionManager {
    struct Candidate {
        uint256 id;
        string name;
        string description;
        string imageIPFSHash;
        uint256 voteCount;
    }

    Candidate[] public candidates;

    function registerCandidate(string memory name, string memory description, string memory imageIPFSHash) public onlyOwner {
        // Register candidate with its information and reference to IPFS
        candidates.push(Candidate({
            id: candidates.length,
            name: name,
            description: description,
            imageIPFSHash: imageIPFSHash,
            voteCount: 0
        }));
    }

    function getCandidate(uint256 candidateId) public view returns (string memory, string memory, string memory, uint256) {
        require(candidateId < candidates.length, "Invalid candidate.");
        Candidate memory c = candidates[candidateId];
        return (c.name, c.description, c.imageIPFSHash, c.voteCount);
    }
}
