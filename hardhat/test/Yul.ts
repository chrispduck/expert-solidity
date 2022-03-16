import { TryingYul } from "../typechain";

const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("TryingYul", function () {

  it("Should return the amount sent", async function () {
    const Contract = await ethers.getContractFactory("TryingYul");
    const contract: TryingYul = await Contract.deploy();
    await contract.deployed();

    // Cant view return value of a mutable func via ethers.js. 
    // Must be done from another contract
    let tx = await contract.paidValueSolidity({ value: 100 });
    let txReceipt = await tx.wait();

    // Use callStatic
    let val = await contract.callStatic.paidValue({ value: 100 });
    expect(val).to.equal(100)

  });
});
