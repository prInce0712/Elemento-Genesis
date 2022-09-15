const { ethers } = require("hardhat");
const { expect, assert } = require("chai");

describe("ElementoGenesis(ERC721)", function () {
  let ElementoGenesisFactory, elementoGenesis;
  beforeEach(async function () {
    ElementoGenesisFactory = await ethers.getContractFactory("ElementoGenesis");
    elementoGenesis = await ElementoGenesisFactory.deploy();
    await elementoGenesis.deployed();
  });

  describe("Deployment", async () => {
    it("should deploy", async () => {
      expect(elementoGenesis);
    });

    it("should mint", async () => {
      await elementoGenesis.mint();
      const token1 = (await elementoGenesis.tokenURI(1)).split(",")[1];
      log(Buffer.from(token1, "base64").toString());
    });
  });
});
