// const { isOfType } = require('@celo/contractkit/lib/identity/claims/claim');
const {expect} = require('chai');
const { ethers } = require("hardhat");

describe('NFT Test', () => { 
    it('TC-1. Test mintVillage deployement',async()=>{
        // const [user] = await ethers.getSigners();
        const Token = await ethers.getContractFactory("TinyVillage");
        const tkn = Token.deploy();
        // expect(tkn).to.be.ok();
    })
    it('TC-2 Test mintVillage mint', async()=>{
        const [user] = await ethers.getSigners();
        const Token = await ethers.getContractFactory("TinyVillage");
        const tkn = await Token.deploy();
       await tkn.mintVillage();
       expect((await tkn.balanceOf(user.address,0)).toNumber()).to.equal(1);
    })
    it('TC-3 Test only one village should get minted', async()=>{
        const [user] = await ethers.getSigners();
        const Token = await ethers.getContractFactory("TinyVillage");
        const tkn = await Token.deploy();
       await tkn.mintVillage();
       expect((await tkn.balanceOf(user.address,0)).toNumber()).to.equal(1);
    })
 })