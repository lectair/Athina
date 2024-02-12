// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.2;

contract ElectionManager {
    address public owner;
    string public electionName;
    bool public electionConcluded;
    uint256 public votingDeadline;

    // List of owners
    address[] public owners;

    // Event for adding a new owner
    event OwnerAdded(address newOwner);

    // Event for removing an existing owner
    event OwnerRemoved(address ownerRemoved);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }

    modifier electionInProgress() {
        require(!electionConcluded, "The election has already concluded.");
        require(block.timestamp <= votingDeadline, "Voting has ended.");
        _;
    }

    // Constructor, contract creator becomes first owner
    constructor() {
        owner = msg.sender;
        owners.push(owner);
    }

    // Define election name
    function setElectionName(string memory _name) public onlyOwner {
        electionName = _name;
    }

    // End election
    function endElection() public onlyOwner electionInProgress {
        electionConcluded = true;
    }

    // Get election status
    function getElectionStatus() public view returns (string memory, bool, uint256) {
        return (electionName, electionConcluded, votingDeadline);
    }

    // Verify if address is owner
    function isOwner(address account) public view returns (bool) {
        for (uint256 i = 0; i < owners.length; i++) {
            if (owners[i] == account) {
                return true;
            }
        }
        return false;
    }

    // Add a new owner (only can be called by an existing owner)
    function addOwner(address newOwner) public onlyOwner {
        require(!isOwner(newOwner), "Address is already an owner.");
        owners.push(newOwner);
        emit OwnerAdded(newOwner);
    }

    // Remove an owner (only can be called by an existing owner)
    function removeOwner(address ownerToRemove) public onlyOwner {
        require(owners.length > 1, "There must be at least one owner.");
        require(ownerToRemove != owner, "You cannot remove yourself if there is only one owner.");

        uint256 indexToRemove;
        for (uint256 i = 0; i < owners.length; i++) {
            if (owners[i] == ownerToRemove) {
                indexToRemove = i;
                break;
            }
        }
        require(indexToRemove != 0 || owners.length == 1, "You cannot remove the original owner.");

        owners[indexToRemove] = owners[owners.length - 1];
        owners.pop();
        emit OwnerRemoved(ownerToRemove);
    }
}
