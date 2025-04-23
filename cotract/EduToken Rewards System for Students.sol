// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EduToken {
    string public name = "EduToken";
    string public symbol = "EDU";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    address public admin;

    mapping(address => uint256) public balanceOf;

    event RewardIssued(address indexed student, uint256 amount);
    event TokensBurned(address indexed student, uint256 amount);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can call this");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function issueReward(address student, uint256 amount) external onlyAdmin {
        require(student != address(0), "Invalid student address");
        balanceOf[student] += amount;
        totalSupply += amount;
        emit RewardIssued(student, amount);
    }

    function burnTokens(uint256 amount) external {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit TokensBurned(msg.sender, amount);
    }
}
