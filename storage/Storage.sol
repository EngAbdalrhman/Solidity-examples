// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Storage {

    uint256 number;

    struct people  {
        uint256 id;
        string name;  
    }
    
    people public ppl = people(1,"speedy");
    people[] public arrppl;
    mapping (uint256 => string) public pplmap;

   //pplmap[1] = "speedy";

    function store(uint256 num) public virtual {
        number = num;
    }

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256){
        return number;
    }

    function fillppl  (uint256 id , string memory name) public{
        arrppl.push(people(id,name));
        pplmap[id] = name;
    }

     function getArray(uint index) public view returns(uint256){
        return arrppl[index].id;
        
    }
}