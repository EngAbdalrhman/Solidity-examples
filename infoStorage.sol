// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "./Storage.sol";

contract infoStorage is Storage{

   
    
    function storageArray(uint256 id , string memory name) public{
        
    }

    function store(uint256 num) public override  {
        number = num + 5;
    }
    

}