const main = async () => {
    
    const kissContractFactory = await hre.ethers.getContractFactory("kissingPortal");
    const kissContract = await kissContractFactory.deploy();
    await kissContract.deployed();
  
    console.log("Contract address:", kissContract.address);
  
    let kissCount;
    kissCount = await kissContract.getTotalKisses();
    console.log(kissCount.toNumber());
  
    let kissTxn = await kissContract.kiss("A message!");
    await kissTxn.wait();

    const [_, randomPerson] = await hre.ethers.getSigners();
    kissTxn = await kissContract.connect(randomPerson).kiss("Another message!");
    await kissTxn.wait();
  
    let allKisses = await kissContract.getAllKisses();
    console.log(allKisses);
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