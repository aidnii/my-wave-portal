const main = async () => {
    
    const kissContractFactory = await hre.ethers.getContractFactory("kissingPortal");
    const kissContract = await kissContractFactory.deploy({
      value: hre.ethers.utils.parseEther("0.1"),
    });
    await kissContract.deployed();
  
    console.log("Contract address:", kissContract.address);
  
    //Get contract balance
    let contractBalance = await hre.ethers.provider.getBalance(
      kissContract.address
    );
    console.log("Contract Balance:", hre.ethers.utils.formatEther(contractBalance));
  
    //send kisses
    let kissTxn = await kissContract.kiss("A message!");
    await kissTxn.wait();

    //Get Contract Balance to see what happened!
    contractBalance = await hre.ethers.provider.getBalance(kissContract.address);
    console.log("Contract Balance:", hre.ethers.utils.formatEther(contractBalance));
  
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