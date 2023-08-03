// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract Fund {

    mapping (address => uint256) funders;
   
    
    function fundMe() public payable {
        require(msg.value > 1e18 , "pay moree");
        funders[msg.sender] = msg.value; // in wei
    }

    function getPrice() public view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price , ,  ,) = priceFeed.latestRoundData();
        return  uint256(price * 1e10); // 10 y?
    }

    function getConversionRate(uint256 etAmount) public view returns(uint256) {
        uint256 etPrice = getPrice();
        uint256 et2usd = (etPrice * etAmount) / 1e18;
        return et2usd;
    }
    

}