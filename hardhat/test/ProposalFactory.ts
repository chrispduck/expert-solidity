import { expect } from "chai";
import { ethers } from "hardhat";
import { ProposalFactory } from "../typechain";

describe("ProposalFactory", function () {
  let proposalFactory: ProposalFactory
  this.beforeAll(async function() {
    const ProposalFactory = await ethers.getContractFactory("ProposalFactory");
    proposalFactory = await ProposalFactory.deploy();
    await proposalFactory.deployed();
  })
it("create proposal", async function () {
    const address = await proposalFactory.createProposal();
    console.log(address);
  });
});
