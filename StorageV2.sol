// SPDX-License-Identifier: Blank  
//Warnings does not stop you from compiling but errors does

pragma solidity ^0.8.8;

import "./SimpleStorage.sol";

// inheritance
contract Storage2 is SimpleStorage {
    // overriding
    // override specifier (the function to override should be virtual)
    function store(uint256 _favNum) public override{
        
        favNum = _favNum + 5;
    }

}