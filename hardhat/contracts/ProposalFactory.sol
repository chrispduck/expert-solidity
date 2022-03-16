//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

contract Proposal {
    int256 public id;
    enum State {
        Proposed,
        Voting,
        Accepted,
        Rejected
    }
    State public state = State.Proposed;
    uint256 public creationTime = block.timestamp;

    constructor(int256 _id) {
        id = _id;
    }

    modifier atState(State _state) {
        require(state == _state);
        _;
    }

    function nextStage() internal {
        state = State(uint256(state) + 1);
    }

    function initiateVoting() public atState(State.Proposed) {}

    function vote() public atState(State.Voting) {}

    function endVoting() public atState(State.Voting) {}
}

contract ProposalFactory {
    int256 ProposalId;

    constructor() {}

    function createProposal() public returns (address) {
        Proposal P = new Proposal(ProposalId);
        ProposalId += 1;
        return address(P);
    }
}
