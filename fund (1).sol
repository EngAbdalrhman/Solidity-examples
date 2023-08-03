// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "./price.sol";

contract Fund {

    using PriceConv for uint256;
    uint256 constant usd = 50 * 1e18; // 18 zeros
    mapping (address => uint256) public funders;
    address[] public afunders;
    address public immutable owner;

    constructor() {
         owner = msg.sender;
    }

    function fundMe() public payable {
        require(msg.value.getConversionRate() >= usd , "pay moree");
        afunders.push(msg.sender);
        funders[msg.sender] += msg.value; // in wei
    }

   function withdraw() public  {

       require(msg.sender == owner , "not owner");
        for (uint256 funderIndex=0; funderIndex < afunders.length; funderIndex++){
            address funder = afunders[funderIndex];
            funders[funder] = 0;
        }
        afunders = new address[](0);
        // // transfer
        // payable(msg.sender).transfer(address(this).balance);
        // // send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");
        // call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }
    
    receive() external payable {
        fundMe();
    }
    fallback() external payable {
        fundMe();
    }
}