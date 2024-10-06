// SPDX-License-Identifier: MIT
pragma solidity ^0.5.8;

contract CharityDonation {
    address payable public charity;
    uint256 public totalDonations;
    mapping(address => uint256) public donations;

    event DonationMade(address indexed donor, uint256 amount);

    constructor(address payable _charity) public {
        charity = _charity;
        totalDonations = 0; 
    }

    function donate() public payable {
        require(msg.value > 0, "Donation must be greater than zero");

        // Transfer donation to charity
        charity.transfer(msg.value);
        
        // Update records
        donations[msg.sender] += msg.value;
        totalDonations += msg.value;

        emit DonationMade(msg.sender, msg.value);
    }

    function getDonationAmount(address donor) public view returns (uint256) {
        return donations[donor];
    }

    function getTotalDonations() public view returns (uint256) {
        return totalDonations;
    }
}
