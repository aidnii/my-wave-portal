const main = async () => {
    const [owner, randomPerson] = await hre.ethers.getSigners();
    const kissContractFactory = await hre.ethers.getContractFactory("kissingPortal");
    const kissContract = await kissContractFactory.deploy();
    await kissContract.deployed();
  
    console.log("Contract deployed to:", kissContract.address);
    console.log("Contract deployed by:", owner.address);
  
    let kissCount;
    kissCount = await kissContract.getTotalKisses();
  
    let kissTxn = await kissContract.kiss();
    await kissTxn.wait();

    kissCount = await kissContract.getTotalKisses();

    kissTxn = await kissContract.connect(randomPerson).kiss();
    await kissTxn.wait();
  
    kissCount = await kissContract.getTotalKisses();
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