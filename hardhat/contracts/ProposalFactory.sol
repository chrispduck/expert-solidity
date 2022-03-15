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
    uint public creationTime = block.timestamp; 
    
    constructor(int256 _id) {
        id = _id;
    }

    modifier atState(State _state){
        require(state==_state);
        _;
    }

    function nextStage() internal {
        state = State(uint(state) + 1);
    }

    function initiateVoting() atState(State.Proposed) public {
        
    }

    function vote() atState(State.Voting) public {
        
    }
    
    function endVoting() atState(State.Voting) public {

    }

}

contract ProposalFactoryTransparentProxy { 
    address implementation;
    address admin;
    fallback() external payable {
        require(msg.sender != admin);
        implementation.delegatecall(abi.encodeWithSelector(bytes4, arg);)
    }
    function upgrade(address newImplementation) external {
        if (msg.sender != admin) fallback();
        implementation = newImplementation;
} 
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
