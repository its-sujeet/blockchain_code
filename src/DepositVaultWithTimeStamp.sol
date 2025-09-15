// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// modified this version to store both amount and timestamp in a struct instead of two separate mappings


contract DepositVaultWithTimeStamp {

    // mapping (address => uint) public balances;
    // mapping (address => uint) public times;

    struct Deposits {
        uint amount;
        uint time;
        
    }

    mapping (address => Deposits) public userDeposits;



    function deposit() external payable{
        require(msg.value > 0, "Must send ETH");
        uint balance = userDeposits[msg.sender].amount;

        userDeposits[msg.sender] = Deposits({
            amount: balance + msg.value,
            time: block.timestamp
        });

        // balances[msg.sender] = balance + msg.value;
        // times[msg.sender] = block.timestamp;
    }

    // function getBalance(address user) external view returns (uint) {
    //     return userDeposits[user].amount;
    // }

    // function getDepositTime(address user) external view returns (uint) {
    //     return userDeposits[user].time;
    // }

    function getTransactionDetails(address user) external view returns (uint, uint) {
        Deposits memory depositDetails = userDeposits[user];
        return (depositDetails.amount, depositDetails.time);
    }
   
}