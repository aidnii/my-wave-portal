const main = async () => {
  
  const kissContractFactory = await hre.ethers.getContractFactory("kissingPortal");
  const kissContract = await kissContractFactory.deploy({
    value: hre.ethers.utils.parseEther("0.001"),
  });
  
  await kissContract.deployed();

  console.log("kissingPortal address: ", kissContract.address);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();