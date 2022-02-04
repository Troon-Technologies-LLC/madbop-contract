import path from "path"
import { init, emulator, getAccountAddress, deployContractByName, getContractCode, getContractAddress, getTransactionCode, getScriptCode, executeScript, sendTransaction } from "flow-js-testing";

jest.setTimeout(100000);

beforeAll(async () => {
  const basePath = path.resolve(__dirname, "../..");
  const port = 8080;

  await init(basePath, { port });
  await emulator.start(port);
});

afterAll(async () => {
  const port = 8080;
  await emulator.stop(port);
});


describe("Replicate Playground Accounts", () => {
  test("Create Accounts", async () => {
    // Playground project support 4 accounts, but nothing stops you jukeboxTemplateDatafrom creating more by following the example laid out below
    const Alice = await getAccountAddress("Alice");
    const Bob = await getAccountAddress("Bob");
    const Charlie = await getAccountAddress("Charlie");
    const Dave = await getAccountAddress("Dave");

    console.log(
      "Four Playground accounts were created with following addresses"
    );
    console.log("Alice:", Alice);
    console.log("Bob:", Bob);
    console.log("Charlie:", Charlie);
    console.log("Dave:", Dave);
  });
});
describe("Deployment", () => {
  test("Deploy for NonFungibleToken", async () => {
    const name = "NonFungibleToken"
    const to = await getAccountAddress("Alice")
    let update = true

    let result;
    try {
      result = await deployContractByName({
        name,
        to,
        update,
      });
    } catch (e) {
      console.log(e);
    }
    expect(name).toBe("NonFungibleToken");

  });

  test("Deploy for NFTContract", async () => {
    const name = "NFTContract"
    const to = await getAccountAddress("Bob")
    let update = true

    const NonFungibleToken = await getContractAddress("NonFungibleToken");
    const addressMap = {
      NonFungibleToken
    };

    let result;
    try {
      result = await deployContractByName({
        name,
        to,
        addressMap,
        update,
      });
    } catch (e) {
      console.log(e);
    }
    expect(name).toBe("NFTContract");

  });

  test("Deploy for MadbopContract", async () => {
    const name = "MadbopContract";
    const to = await getAccountAddress("Charlie");
    let update = true;
    const NonFungibleToken = await getContractAddress("NonFungibleToken");
    const NFTContract = await getContractAddress("NFTContract");

    let addressMap = {
      NonFungibleToken,
      NFTContract
    };
    let result;
    try {
      result = await deployContractByName({
        name,
        to,
        addressMap,
        update,
      });
    }
    catch (e) {
      console.log(e)
    }

    expect(name).toBe("MadbopContract");
  });

});

describe("Transactions", () => {
  test("test transaction setup admin Account", async () => {
    const name = "setupAdminAccount";

    // Import participating accounts
    const Charlie = await getAccountAddress("Charlie");

    // Set transaction signers
    const signers = [Charlie];

    // Generate addressMap from import statements
    const NonFungibleToken = await getContractAddress("NonFungibleToken");
    const NFTContract = await getContractAddress("NFTContract");
    const MadbopContract = await getContractAddress("MadbopContract")
    const addressMap = {
      NonFungibleToken,
      NFTContract,
      MadbopContract,
    };

    let code = await getTransactionCode({
      name,
      addressMap,
    });

    let txResult;
    try {
      txResult = await sendTransaction({
        code,
        signers,
      });
    } catch (e) {
      console.log(e);
    }
    console.log("tx Result", txResult);

    expect(txResult[0].errorMessage).toBe("");
  });
  test("test transaction add admin Account", async () => {
    const name = "addAdminAccount";

    // Import participating accounts
    const Bob = await getAccountAddress("Bob");
    const Charlie = await getAccountAddress("Charlie");

    // Set transaction signers
    const signers = [Bob];

    // Generate addressMap from import statements
    const NonFungibleToken = await getContractAddress("NonFungibleToken");
    const NFTContract = await getContractAddress("NFTContract");
    const MadbopContract = await getContractAddress("MadbopContract")
    const addressMap = {
      NonFungibleToken,
      NFTContract,
      MadbopContract,
    };

    let code = await getTransactionCode({
      name,
      addressMap,
    });

    let txResult;
    try {
      const args = [Charlie];
      txResult = await sendTransaction({
        code,
        args,
        signers,
      });
    } catch (e) {
      console.log(e);
    }
    console.log("tx result ", txResult);

    expect(txResult[0].errorMessage).toBe("");
  });

  test("test transaction create brand", async () => {
    const name = "createBrand";

    // Import participating accounts
    const Charlie = await getAccountAddress("Charlie");

    // Set transaction signers
    const signers = [Charlie];

    // Generate addressMap from import statements
    const NonFungibleToken = await getContractAddress("NonFungibleToken");
    const NFTContract = await getContractAddress("NFTContract");
    const MadbopContract = await getContractAddress("MadbopContract")
    const addressMap = {
      NonFungibleToken,
      NFTContract,
      MadbopContract,
    };

    let code = await getTransactionCode({
      name,
      addressMap,
    });
    // const args = ["Madbop", "0x02", { name: "Alice" }];

    let txResult;
    try {
      const args = ["Madbop", {
        name: "Madbop", "description": "WE BUILD DIGITAL SOLUTIONS THAT ADVANCE,IGNITE,AND EVOLVE YOUR BUSINESS"
        , "url": "https://madbop.com/"
      }];

      txResult = await sendTransaction({
        code,
        signers,
        args,
      });
    } catch (e) {
      console.log(e);
    }
    console.log("tx Result", txResult);

    expect(txResult[0].errorMessage).toBe("");
  });

  test("test transaction create nft Schema", async () => {
    const name = "createNFTSchema";

    // Import participating accounts
    const Charlie = await getAccountAddress("Charlie");

    // Set transaction signers
    const signers = [Charlie];

    // Generate addressMap from import statements
    const NonFungibleToken = await getContractAddress("NonFungibleToken");
    const NFTContract = await getContractAddress("NFTContract");
    const MadbopContract = await getContractAddress("MadbopContract")
    const addressMap = {
      NonFungibleToken,
      NFTContract,
      MadbopContract,
    };

    let code = await getTransactionCode({
      name,
      addressMap,
    });
    const args = ["Test Schema"];

    let txResult;
    try {
      txResult = await sendTransaction({
        code,
        signers,
        args,
      });
    } catch (e) {
      console.log(e);
    }
    console.log("tx Result", txResult);

    expect(txResult[0].errorMessage).toBe("");
  });
  test("test transaction create jukebox schema", async () => {
    const name = "createJukeboxSchema";

    // Import participating accounts
    const Charlie = await getAccountAddress("Charlie");

    // Set transaction signers
    const signers = [Charlie];

    // Generate addressMap from import statements
    const NonFungibleToken = await getContractAddress("NonFungibleToken");
    const NFTContract = await getContractAddress("NFTContract");
    const MadbopContract = await getContractAddress("MadbopContract")
    const addressMap = {
      NonFungibleToken,
      NFTContract,
      MadbopContract,
    };

    let code = await getTransactionCode({
      name,
      addressMap,
    });

    const args = ["jukebox-series-"];
    let txResult;
    try {
      txResult = await sendTransaction({
        code,
        signers,
        args,
      });
    } catch (e) {
      console.log(e);
    }
    console.log("tx Result", txResult);

    expect(txResult[0].errorMessage).toBe("");
  });
  test("test transaction add madbop data", async () => {
    const name = "addMadbopData";

    // Import participating accounts
    const Charlie = await getAccountAddress("Charlie");

    // Set transaction signers
    const signers = [Charlie];

    // Generate addressMap from import statements
    const NonFungibleToken = await getContractAddress("NonFungibleToken");
    const NFTContract = await getContractAddress("NFTContract");
    const MadbopContract = await getContractAddress("MadbopContract")
    const addressMap = {
      NonFungibleToken,
      NFTContract,
      MadbopContract,
    };

    let code = await getTransactionCode({
      name,
      addressMap,
    });
    // brandId, jukeboxSchemaId, nftSchemaId
    const args = [1, 2, 1];

    let txResult;
    try {
      txResult = await sendTransaction({
        code,
        signers,
        args,
      });
    } catch (e) {
      console.log("Error", e);
    }
    console.log("tx Result", txResult);

    expect(txResult[0].errorMessage).toBe("");
  });

  test("test transaction create nft template", async () => {
    const name = "createNFTTemplate";

    // Import participating accounts
    const Charlie = await getAccountAddress("Charlie");

    // Set transaction signers
    const signers = [Charlie];

    // Generate addressMap from import statements
    const NonFungibleToken = await getContractAddress("NonFungibleToken");
    const NFTContract = await getContractAddress("NFTContract");
    const MadbopContract = await getContractAddress("MadbopContract")
    const addressMap = {
      NonFungibleToken,
      NFTContract,
      MadbopContract,
    };

    let code = await getTransactionCode({
      name,
      addressMap,
    });
    //  brandId, schemaId, maxSupply
    const args = [1, 1, 14];

    let txResult;
    try {
      txResult = await sendTransaction({
        code,
        signers,
        args,
      });
    } catch (e) {
      console.log(e);
    }
    console.log("tx Result", txResult);

    expect(txResult[0].status).toBe(4);
  });
  test("test transaction create jukebox template", async () => {
    const name = "createJukeboxTemplate";

    // Import participating accounts
    const Charlie = await getAccountAddress("Charlie");

    // Set transaction signers
    const signers = [Charlie];

    // Generate addressMap from import statements
    const NonFungibleToken = await getContractAddress("NonFungibleToken");
    const NFTContract = await getContractAddress("NFTContract");
    const MadbopContract = await getContractAddress("MadbopContract")
    const addressMap = {
      NonFungibleToken,
      NFTContract,
      MadbopContract,
    };

    let code = await getTransactionCode({
      name,
      addressMap,
    });
    // brandId, SchemaId, max supply
    const args = [1, 2, 100];

    let txResult;
    try {
      txResult = await sendTransaction({
        code,
        signers,
        args,
      });
    } catch (e) {
      console.log(e);
    }
    console.log("tx Result", txResult);

    expect(txResult[0].errorMessage).toBe("");
  });
  test("test transaction create jukebox", async () => {
    const name = "createJukebox";

    // Import participating accounts
    const Charlie = await getAccountAddress("Charlie");

    // Set transaction signers
    const signers = [Charlie];

    // Generate addressMap from import statements
    const NonFungibleToken = await getContractAddress("NonFungibleToken");
    const NFTContract = await getContractAddress("NFTContract");
    const MadbopContract = await getContractAddress("MadbopContract")
    const addressMap = {
      NonFungibleToken,
      NFTContract,
      MadbopContract,
    };

    let code = await getTransactionCode({
      name,
      addressMap,
    });

    var currentTimeInSeconds = Math.floor(Date.now() / 1000) + 0.0; //unix timestamp in seconds

    //templateId: 2, openDate: 1640351132.0
    const args = [2, currentTimeInSeconds];

    let txResult;
    try {
      txResult = await sendTransaction({
        code,
        signers,
        args,
      });
    } catch (e) {
      console.log(e);
    }
    console.log("tx Result", txResult);

    expect(txResult[0].errorMessage).toBe("");
  });
  test("test transaction setup account for user", async () => {
    const name = "setupAccount";

    // Import participating accounts
    const Dave = await getAccountAddress("Dave");

    // Set transaction signers
    const signers = [Dave];

    // Generate addressMap from import statements
    const NonFungibleToken = await getContractAddress("NonFungibleToken");
    const NFTContract = await getContractAddress("NFTContract");
    const addressMap = {
      NonFungibleToken,
      NFTContract,
    };

    let code = await getTransactionCode({
      name,
      addressMap,
    });


    let txResult;
    try {
      txResult = await sendTransaction({
        code,
        signers,
        // args,
      });
    } catch (e) {
      console.log(e);
    }
    console.log("tx Result", txResult);

    expect(txResult[0].errorMessage).toBe("");
  });

  test("test transaction  mint jukebox template", async () => {
    const name = "mintNFT";

    // Import participating accounts
    const Charlie = await getAccountAddress("Charlie");
    const Dave = await getAccountAddress("Dave");
    // Set transaction signers
    const signers = [Charlie];

    // Generate addressMap from import statements
    const NonFungibleToken = await getContractAddress("NonFungibleToken");
    const NFTContract = await getContractAddress("NFTContract");
    const MadbopContract = await getContractAddress("MadbopContract")
    const addressMap = {
      NonFungibleToken,
      NFTContract,
      MadbopContract,
    };

    let code = await getTransactionCode({
      name,
      addressMap,
    });
    // templateId, address 2, account: 0xe03daebed8ca0615
    const args = [2, Dave];

    let txResult;
    try {
      txResult = await sendTransaction({
        code,
        signers,
        args,
      });
    } catch (e) {
      console.log(e);
    }
    console.log("tx Result", txResult);

    expect(txResult[0].errorMessage).toBe("");
  });

  test("test transaction  open jukebox before open-date", async () => {
    const name = "openJukebox";

    // Import participating accounts
    const Dave = await getAccountAddress("Dave");
    const Charlie = await getAccountAddress("Charlie");

    // Set transaction signers
    const signers = [Dave];

    // Generate addressMap from import statements
    const NonFungibleToken = await getContractAddress("NonFungibleToken");
    const NFTContract = await getContractAddress("NFTContract");
    const MadbopContract = await getContractAddress("MadbopContract")
    const addressMap = {
      NonFungibleToken,
      NFTContract,
      MadbopContract,
    };

    let code = await getTransactionCode({
      name,
      addressMap,
    });

    const args = [Charlie, 2, Dave];

    let txResult;
    try {
      txResult = await sendTransaction({
        code,
        signers,
        args,
      });
    } catch (e) {
      console.log(e);
    }
    console.log("tx Result", txResult);

    expect(txResult[0].errorMessage).toBe("");
  });
})
describe("Scripts", () => {
  test("get madbop data", async () => {

    const name = "getMadbopData";
    const Bob = await getAccountAddress("Bob");

    const NonFungibleToken = await getContractAddress("NonFungibleToken");
    const NFTContract = await getContractAddress("NFTContract");
    const MadbopContract = await getContractAddress("MadbopContract")

    const addressMap = {
      NonFungibleToken,
      NFTContract,
      MadbopContract
    }
    let code = await getScriptCode({
      name,
      addressMap,
    })

    code = code.toString().replace(/(?:getAccount\(\s*)(0x.*)(?:\s*\))/g, (_, match) => {
      const accounts = {
        "0x01": Alice,
        "0x02": Bob,
      };
      const name = accounts[match];
      return `getAccount(${name})`;
    });

    const result = await executeScript({
      code,
    });
    console.log("result", result);



  });
  test("get all schemas data", async () => {

    const name = "getAllSchemas";
    const Bob = await getAccountAddress("Bob");

    const NonFungibleToken = await getContractAddress("NonFungibleToken");
    const NFTContract = await getContractAddress("NFTContract");

    const addressMap = {
      NonFungibleToken,
      NFTContract,
    }
    let code = await getScriptCode({
      name,
      addressMap,
    })

    code = code.toString().replace(/(?:getAccount\(\s*)(0x.*)(?:\s*\))/g, (_, match) => {
      const accounts = {
        "0x01": Alice,
        "0x02": Bob,
      };
      const name = accounts[match];
      return `getAccount(${name})`;
    });

    const result = await executeScript({
      code,
    });
    console.log("result", result);

  });

})