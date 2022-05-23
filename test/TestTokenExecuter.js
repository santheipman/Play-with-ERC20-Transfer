const { expect } = require('chai');
const { ethers } = require('hardhat');

describe("TestTokenExecuter", function () {
    let owner;
    let user1;
    let token;
    let executer;
    beforeEach(async function() {
        [owner, user1] = await ethers.getSigners();
        Executer = await ethers.getContractFactory('TestTokenExecuter');

        executer = await Executer.deploy(1_000_000);
        tokenContractAddress = await executer.getTokenAddress();
        token = await ethers.getContractAt('TestToken', tokenContractAddress);
    });

    it("Mint 1_000_000 TEST to ADMIN account", async function () {
        expect(await token.balanceOf(owner.address)).to.equal(1_000_000);
    });

    it("Send 100_000 TEST from ADMIN to this contract", async function () {
        await executer.transferFromAdminTo(executer.address, 100_000);
        expect(await token.balanceOf(executer.address)).to.equal(100_000);
    });

    it("Send 100 TEST from this contract to user account", async function () {
        await executer.transferFromAdminTo(executer.address, 100_000);
        await executer.transferFromAdminTo(user1.address, 100);
        expect(await token.balanceOf(user1.address)).to.equal(100);
    });
});