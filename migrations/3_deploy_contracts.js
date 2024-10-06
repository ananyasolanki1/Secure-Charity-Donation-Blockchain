const CharityDonation = artifacts.require("CharityDonation");

module.exports = function(deployer) {
  deployer.deploy(CharityDonation, '0x1234567890abcdef1234567890abcdef12345678'); // Replace with a valid Ethereum address
};
