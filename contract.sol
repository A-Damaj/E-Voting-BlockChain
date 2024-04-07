// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CustomVoting {
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    Candidate[] public candidates;
    address public owner;
    mapping(address => bool) public hasVoted;

    uint256 public votingStart;
    uint256 public votingEnd;

    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner can perform this action.");
        _;
    }

    modifier validCandidate(uint256 _candidateIndex) {
        require(_candidateIndex < candidates.length, "Invalid candidate index.");
        _;
    }

    constructor(string[] memory _initialCandidateNames, uint256 _durationInMinutes) {
        for (uint256 i = 0; i < _initialCandidateNames.length; i++) {
            candidates.push(Candidate({
                name: _initialCandidateNames[i],
                voteCount: 0
            }));
        }
        owner = msg.sender;
        votingStart = block.timestamp;
        votingEnd = block.timestamp + (_durationInMinutes * 1 minutes);
    }

    function addNewCandidate(string memory _name) public onlyOwner {
        candidates.push(Candidate({
            name: _name,
            voteCount: 0
        }));
    }

    function castVote(uint256 _candidateIndex) public validCandidate(_candidateIndex) {
        require(!hasVoted[msg.sender], "You have already voted.");
        require(block.timestamp >= votingStart && block.timestamp < votingEnd, "Voting is not open.");

        candidates[_candidateIndex].voteCount++;
        hasVoted[msg.sender] = true;
    }

    function getCandidateVotes(uint256 _candidateIndex) public view validCandidate(_candidateIndex) returns (uint256) {
        return candidates[_candidateIndex].voteCount;
    }

    function getVotingStatus() public view returns (bool) {
        return (block.timestamp >= votingStart && block.timestamp < votingEnd);
    }

    function getRemainingTime() public view returns (uint256) {
        require(block.timestamp >= votingStart, "Voting has not started yet.");
        if (block.timestamp >= votingEnd) {
            return 0;
        }
        return votingEnd - block.timestamp;
    }

function getAllCandidates() public view returns (string[] memory, uint256[] memory) {
    string[] memory candidateNames = new string[](candidates.length);
    uint256[] memory candidateVotes = new uint256[](candidates.length);

    for (uint256 i = 0; i < candidates.length; i++) {
        candidateNames[i] = candidates[i].name;
        candidateVotes[i] = candidates[i].voteCount;
    }

    return (candidateNames, candidateVotes);
}

function NumberOfCandidates() public view returns (uint256) {
    return candidates.length;
}

}
