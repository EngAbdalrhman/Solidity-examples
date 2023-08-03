// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "./Storage.sol";

contract StorageFactory{

    Storage public st  = new Storage();
    
    function storageArray(uint256 id , string memory name) public{
        st.fillppl(id, name);
    }

    function getArray(uint index) public view returns(uint256){
        return st.getArray(index);

    }
    

}