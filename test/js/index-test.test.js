import path from "path"
import { init, emulator, getAccountAddress, deployContractByName, getContractCode, getContractAddress, getTransactionCode, getScriptCode, executeScript, sendTransaction } from "flow-js-testing";

jest.setTimeout(100000);

beforeAll(async () => {
  const basePath = path.resolve(__dirname, "../../Cadence");
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
  // test("test transaction setup Account", async () => {
  //   const name = "setupAccount";

  //   // Import participating accounts
  //   const Bob = await getAccountAddress("Bob");

  //   // Set transaction signers
  //   const signers = [Bob];

  //   // Generate addressMap from import statements
  //   const NonFungibleToken = await getContractAddress("NonFungibleToken");
  //   const NFTContract = await getContractAddress("NFTContract");
  //   const MadbopContract = await getContractAddress("MadbopContract")
  //   const addressMap = {
  //     NonFungibleToken,
  //     NFTContract,
  //     MadbopContract,
  //   };

  //   let code = await getTransactionCode({
  //     name,
  //     addressMap,
  //   });

  //   let txResult;
  //   try {
  //     txResult = await sendTransaction({
  //       code,
  //       signers,
  //     });
  //   } catch (e) {
  //     console.log(e);
  //   }

  //   // expect(txResult.errorMessage).toBe("");
  // });
  test("test transaction setup admin Account", async () => {
    const name = "setupAccount";

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

    // expect(txResult.errorMessage).toBe("");
  });
  test("test transaction add admin Account", async () => {
    const name = "addAdminAccount";

    // Import participating accounts
    const Bob = await getAccountAddress("Bob");

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
      txResult = await sendTransaction({
        code,
        signers,
      });
    } catch (e) {
      console.log(e);
    }
    console.log("tx result ", txResult);

    // expect(txResult.errorMessage).toBe("");
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
      txResult = await sendTransaction({
        code,
        signers,
        // args,
      });
    } catch (e) {
      console.log(e);
    }
    console.log("tx Result", txResult);

    // expect(txResult.errorMessage).toBe("");
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
    // const args = ["Test Schema", "0x03"];

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

    // expect(txResult.errorMessage).toBe("");
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
    // brandId, schemaId, maxSupply,immutableData
    // const args = [1, 1, 100];
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

    // expect(txResult.errorMessage).toBe("");
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
    // var test = 1
    // const args = [1, "0x04", "2269511522.0", "2369511522.0"];

    let txResult;
    try {
      txResult = await sendTransaction({
        code,
        signers,
        // args,
      });
    } catch (e) {
      console.log("Error", e);
    }
    console.log("tx Result", txResult);

    // expect(txResult.errorMessage).toBe("");
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

    // const args = [1, 1, 4, "0xf3fcd2c1a78f5eee"];

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

    // expect(txResult.errorMessage).toBe("");
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

    // const args = [1, 1, 4, "0xf3fcd2c1a78f5eee"];

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

    // expect(txResult.errorMessage).toBe("");
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

    // const args = [1, 1, 4, "0xf3fcd2c1a78f5eee"];

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

    // expect(txResult.errorMessage).toBe("");
  });
  test("test transaction setup account for user", async () => {
    const name = "sAccount";

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

    // const args = [1, 1, 4, "0xf3fcd2c1a78f5eee"];

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

    // expect(txResult.errorMessage).toBe("");
  });
  test("test transaction  mint jukebox template", async () => {
    const name = "mintNFT";

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

    // const args = [1, 1, 4, "0xf3fcd2c1a78f5eee"];

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

    // expect(txResult.errorMessage).toBe("");
  });
  test("test transaction  open jukebox before open-date", async () => {
    const name = "openJukebox";

    // Import participating accounts
    const Dave = await getAccountAddress("Dave");

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

    // const args = [1, 1, 4, "0xf3fcd2c1a78f5eee"];

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

    // expect(txResult.errorMessage).toBe("");
  });

  test("test transaction  open jukebox after open-date", async () => {
    const name = "openJukebox";

    // Import participating accounts
    const Dave = await getAccountAddress("Dave");

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

    // const args = [1, 1, 4, "0xf3fcd2c1a78f5eee"];

    let txResult;
    setTimeout(async () => {
      try {
        txResult = await sendTransaction({
          code,
          signers,
          // args,
        });
      } catch (e) {
        console.log(e);
      }
    }, 180000)
    console.log("tx Result", txResult);

    // expect(txResult.errorMessage).toBe("");
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
  // test("get brand data by Id", async () => {

  //   const name = "getBrandById";
  //   const Bob = await getAccountAddress("Bob");

  //   const NonFungibleToken = await getContractAddress("NonFungibleToken");
  //   const NFTContract = await getContractAddress("NFTContract");

  //   const addressMap = {
  //     NonFungibleToken,
  //     NFTContract,
  //   }
  //   let code = await getScriptCode({
  //     name,
  //     addressMap,
  //   });
  //   const args = [1];

  //   code = code.toString().replace(/(?:getAccount\(\s*)(0x.*)(?:\s*\))/g, (_, match) => {
  //     const accounts = {
  //       "0x01": Alice,
  //       "0x02": Bob,
  //     };
  //     const name = accounts[match];
  //     return `getAccount(${name})`;
  //   });

  //   const result = await executeScript({
  //     code,
  //     args,
  //   });
  //   console.log("result", result);

  // });
  // test("get schema data", async () => {

  //   const name = "getallSchema";
  //   const Bob = await getAccountAddress("Bob");

  //   const NonFungibleToken = await getContractAddress("NonFungibleToken");
  //   const NFTContract = await getContractAddress("NFTContract");

  //   const addressMap = {
  //     NonFungibleToken,
  //     NFTContract,
  //   }
  //   let code = await getScriptCode({
  //     name,
  //     addressMap,
  //   })

  //   code = code.toString().replace(/(?:getAccount\(\s*)(0x.*)(?:\s*\))/g, (_, match) => {
  //     const accounts = {
  //       "0x01": Alice,
  //       "0x02": Bob,
  //     };
  //     const name = accounts[match];
  //     return `getAccount(${name})`;
  //   });

  //   const result = await executeScript({
  //     code,
  //   });
  //   console.log("result", result);

  // });

  // test("get schema data by Id", async () => {

  //   const name = "getSchemaById";
  //   const Bob = await getAccountAddress("Bob");

  //   const NonFungibleToken = await getContractAddress("NonFungibleToken");
  //   const NFTContract = await getContractAddress("NFTContract");

  //   const addressMap = {
  //     NonFungibleToken,
  //     NFTContract,
  //   }
  //   let code = await getScriptCode({
  //     name,
  //     addressMap,
  //   })

  //   code = code.toString().replace(/(?:getAccount\(\s*)(0x.*)(?:\s*\))/g, (_, match) => {
  //     const accounts = {
  //       "0x01": Alice,
  //       "0x02": Bob,
  //     };
  //     const name = accounts[match];
  //     return `getAccount(${name})`;
  //   });

  //   const result = await executeScript({
  //     code,
  //   });
  //   console.log("result", result);

  // });
  // test("get template data ", async () => {

  //   const name = "getAllTemplates";
  //   const Bob = await getAccountAddress("Bob");

  //   const NonFungibleToken = await getContractAddress("NonFungibleToken");
  //   const NFTContract = await getContractAddress("NFTContract");

  //   const addressMap = {
  //     NonFungibleToken,
  //     NFTContract,
  //   }
  //   let code = await getScriptCode({
  //     name,
  //     addressMap,
  //   })

  //   code = code.toString().replace(/(?:getAccount\(\s*)(0x.*)(?:\s*\))/g, (_, match) => {
  //     const accounts = {
  //       "0x01": Alice,
  //       "0x02": Bob,
  //     };
  //     const name = accounts[match];
  //     return `getAccount(${name})`;
  //   });

  //   const result = await executeScript({
  //     code,
  //   });
  //   console.log("result", result);

  // });
  // test("get template data by Id", async () => {

  //   const name = "getTemplateById";
  //   const Bob = await getAccountAddress("Bob");

  //   const NonFungibleToken = await getContractAddress("NonFungibleToken");
  //   const NFTContract = await getContractAddress("NFTContract");

  //   const addressMap = {
  //     NonFungibleToken,
  //     NFTContract,
  //   }
  //   let code = await getScriptCode({
  //     name,
  //     addressMap,
  //   })

  //   code = code.toString().replace(/(?:getAccount\(\s*)(0x.*)(?:\s*\))/g, (_, match) => {
  //     const accounts = {
  //       "0x01": Alice,
  //       "0x02": Bob,
  //     };
  //     const name = accounts[match];
  //     return `getAccount(${name})`;
  //   });

  //   const result = await executeScript({
  //     code,
  //   });
  //   console.log("result", result);

  // });
  // test("get drop data ", async () => {

  //   const name = "getAllDrops";
  //   const Bob = await getAccountAddress("Bob");

  //   const NonFungibleToken = await getContractAddress("NonFungibleToken");
  //   const NFTContract = await getContractAddress("NFTContract");

  //   const addressMap = {
  //     NonFungibleToken,
  //     NFTContract,
  //   }
  //   let code = await getScriptCode({
  //     name,
  //     addressMap,
  //   })

  //   code = code.toString().replace(/(?:getAccount\(\s*)(0x.*)(?:\s*\))/g, (_, match) => {
  //     const accounts = {
  //       "0x01": Alice,
  //       "0x02": Bob,
  //     };
  //     const name = accounts[match];
  //     return `getAccount(${name})`;
  //   });

  //   const result = await executeScript({
  //     code,
  //   });
  //   console.log("result", result);

  // });
  // test("get drop data by Id", async () => {

  //   const name = "getDropById";
  //   const Charlie = await getAccountAddress("Charlie");

  //   const NonFungibleToken = await getContractAddress("NonFungibleToken");
  //   const NFTContract = await getContractAddress("NFTContract");
  //   const NowwhereContract = await getContractAddress("NowwhereContract")

  //   const addressMap = {
  //     NonFungibleToken,
  //     NFTContract,
  //     NowwhereContract,
  //   }
  //   let code = await getScriptCode({
  //     name,
  //     addressMap,
  //   })
  //   console.log("code", code);

  //   code = code.toString().replace(/(?:getAccount\(\s*)(0x.*)(?:\s*\))/g, (_, match) => {
  //     const accounts = {
  //       "0x01": Alice,
  //       "0x02": Bob,
  //       "0X03": Charlie,
  //     };
  //     const name = accounts[match];
  //     console.log("accounts", accounts);
  //     console.log("name", name);
  //     return `getAccount(${name})`;
  //   });

  //   const result = await executeScript({
  //     code,
  //   });
  //   console.log("result", result);

  // });
  // test("get all nfts  data", async () => {

  //   const name = "getAllNFTIds";
  //   const Charlie = await getAccountAddress("Charlie");

  //   const NonFungibleToken = await getContractAddress("NonFungibleToken");
  //   const NFTContract = await getContractAddress("NFTContract");
  //   const NowwhereContract = await getContractAddress("NowwhereContract")

  //   const addressMap = {
  //     NonFungibleToken,
  //     NFTContract,
  //     NowwhereContract,

  //   }

  //   let code = await getScriptCode({
  //     name,
  //     addressMap,
  //   })

  //   code = code.toString().replace(/(?:getAccount\(\s*)(0x.*)(?:\s*\))/g, (_, match) => {
  //     const accounts = {
  //       "0x03": Charlie,
  //     };
  //     const name = accounts[match];
  //     return `getAccount(${name})`;
  //   });

  //   const result = await executeScript({
  //     code,
  //   });
  //   console.log("result", result);

  // });
  // test("get nft template data", async () => {

  //   const name = "getNFTTemplateData";
  //   const Charlie = await getAccountAddress("Charlie");

  //   const NonFungibleToken = await getContractAddress("NonFungibleToken");
  //   const NFTContract = await getContractAddress("NFTContract");

  //   const addressMap = {
  //     NonFungibleToken,
  //     NFTContract,
  //   }
  //   let code = await getScriptCode({
  //     name,
  //     addressMap,
  //   })

  //   code = code.toString().replace(/(?:getAccount\(\s*)(0x.*)(?:\s*\))/g, (_, match) => {
  //     const accounts = {
  //       "0x03": Charlie,
  //     };
  //     const name = accounts[match];
  //     return `getAccount(${name})`;
  //   });

  //   const result = await executeScript({
  //     code,
  //   });
  //   console.log("result", result);

  // });
  // test("get nft maxSupply drop data", async () => {

  //   const name = "getMaxSupply";
  //   const Bob = await getAccountAddress("Bob");

  //   const NonFungibleToken = await getContractAddress("NonFungibleToken");
  //   const NFTContract = await getContractAddress("NFTContract");

  //   const addressMap = {
  //     NonFungibleToken,
  //     NFTContract,
  //   }
  //   let code = await getScriptCode({
  //     name,
  //     addressMap,
  //   })

  //   code = code.toString().replace(/(?:getAccount\(\s*)(0x.*)(?:\s*\))/g, (_, match) => {
  //     const accounts = {
  //       "0x01": Alice,
  //       "0x02": Bob,
  //     };
  //     const name = accounts[match];
  //     return `getAccount(${name})`;
  //   });

  //   const result = await executeScript({
  //     code,
  //   });
  //   console.log("result", result);

  // });
})