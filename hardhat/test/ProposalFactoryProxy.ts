import { expect } from "chai";
import { ethers, upgrades } from "hardhat";
import { ProposalFactory } from "../typechain";

describe("ProposalFactoryProxy", function () {
  var proposalFactory: ProposalFactory;
  it("create and call", async function () {
    const ProposalFactory = await ethers.getContractFactory("ProposalFactory");
    let proposalFactory = await upgrades.deployProxy(ProposalFactory);
    await proposalFactory.deployed();
    console.log(proposalFactory);
    console.log(await proposalFactory.createProposal());
  })
});