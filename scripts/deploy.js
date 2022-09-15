const { ethers } = require("hardhat");

async function main() {
  const ElementoGenesisFactory = await ethers.getContractFactory(
    "ElementoGenesis"
  );
  console.log("Deploying Contract..");
  const ElementoGenesis = await ElementoGenesisFactory.deploy();
  await ElementoGenesis.deployed();
}
// async function verify(contractAddress, args) {
const verify = async (contractAddress, args) => {
  console.log("Verifying contract...");
  try {
    await run("verify:verify", {
      address: contractAddress,
      constructorArguments: args,
    });
  } catch (e) {
    if (e.message.toLowerCase().includes("already verified")) {
      console.log("Already Verified!");
    } else {
      console.log(e);
    }
  }
};

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
