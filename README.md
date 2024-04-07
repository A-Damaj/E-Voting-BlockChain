# E-Voting-BlockChain-Project*

## Description*

This is a simple voting contract written in Solidity. It allows for the creation of candidates and enables users to vote for them. The contract ensures that each address can only vote once and provides several utility functions for interacting with the contract.

## Features*

- **Candidate Creation**: Candidates can be added to the contract by the owner.
- **Voting**: Any address can cast a vote for a valid candidate.
- **Vote Counting**: The contract keeps track of the number of votes each candidate has received.
- **Voting Period**: The contract enforces a voting period during which votes can be cast.
- **Access Control**: Only the owner of the contract can add new candidates.

## Usage*

1. **Deploy the Contract**: Deploy the contract by providing an array of initial candidate names and the duration of the voting period in minutes.
2. **Add Candidates**: The owner can add more candidates by calling the `addNewCandidate` function with the candidate's name.
3. **Cast Votes**: Users can cast their votes by calling the `castVote` function with the index of the candidate they want to vote for.
4. **Check Votes**: Anyone can check the number of votes a candidate has received by calling the `getCandidateVotes` function with the index of the candidate.
5. **Check Voting Status**: Anyone can check whether the voting period is open by calling the `getVotingStatus` function.
6. **Check Remaining Time**: Anyone can check the remaining time for the voting period by calling the `getRemainingTime` function.
7. **Get All Candidates**: Anyone can get the names and vote counts of all candidates by calling the `getAllCandidates` function.
8. **Get Number of Candidates**: Anyone can get the total number of candidates by calling the `NumberOfCandidates` function.

## Limitations*

1. **Candidate Duplication**: The contract does not prevent the owner from adding candidates with the same name. This could lead to confusion when voting.

2. **Candidate Removal**: Once a candidate is added, there's no way to remove them. If a candidate is added mistakenly, it could cause issues.

3. **Voting Duration**: The voting duration is set at the time of contract deployment and cannot be changed. This could be problematic if the voting period needs to be extended or shortened.

4. **Vote Revocation**: Once a vote has been cast, it cannot be changed or revoked. This could be an issue if a voter changes their mind.

5. **Pseudo-Anonymity**: Ethereum addresses provide pseudo-anonymity. However, transaction patterns could potentially reveal a user's identity. Also, if a voter's Ethereum address is linked to their real-world identity, their vote is not anonymous as the `castVote` function records the voter's address, meaning that anyone can see which addresses voted for which candidate.



## License*

This project is licensed under the terms of the MIT license.
