// SPDX-License-Identifier: Blank  
// Warnings do not stop you from compiling but errors do

pragma solidity ^0.8.8;
// pragma solidity 0.8.7;
// pragma solidity ^0.8.7;
// pragma solidity >= 0.8.7 < 0.9.0;

contract SimpleStorage {

    // 1a
    // Types: boolean, uint, int, string, address, bytes
    // bool hasFavNumber = false;
    // uint favNumber = 123;
    // uint256 favNumber = 123;
    // int favNumber = -123;
    // int256 favNumber = -123;
    // string favNumberInText = "123";
    // address myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    // bytes4 favBytes = "This";
    // uint favNum;  default visibility is internal

    // 1b
    uint256 favNum = 1;  // if no num is given, then default val is 0; storage var
    // uint256 public favNum; //automatic getter

    // 1c
    function store(uint256 _favNum) public {
        favNum = _favNum;
        // favNum = favNum + 10;
    }

    // 1d
    // view, pure [cannot modify state, also pure cannot read; no gas spent normally]
    // if a function that modifies state calls this, then it also costs gas
    function retrieve() public view returns(uint256) {
        return favNum;
    }


    // 2a. struct usage for multiple favNums
    struct People {
        string name;
        uint256 favNum;
    }
    People public person = People({name: "New1", favNum:5});

    // 2b. arrays
    // uint256[] public favNumList; //dynamic array since size is not specified
    // uint256[5] public favNumList; //fixed-size array
    People[] public people;

    //4a. Mappings
    mapping(string => uint256) public nameToFavNum;

    //2c. Add function for people array
    function addPerson(string memory _name, uint256 _favNum) public{
        
        People memory newPerson = People(_name, _favNum);
        // 2nd way: People memory newPerson = People({name: _name, favNum: _favNum});
        
        people.push(newPerson);
        // 2nd way: people.push(People(_favNum,_name));

        //4b
        nameToFavNum[_name] = _favNum;
    }



}

// 1e
// Smart Contract Address Instance: 0xf8e81D47203A594245E36C48e151709F0C19fBe8

//3a EVM data storage and access
// 6 places: Stack, Memory, Storage, Calldata, Code, Logs
// calldata and memory (temporary, during the transaction)
// calldata cannot be modified but memory can be
// storage (not temporary, can be modified)
// stack, code, logs (different story)
// data location can only be specified for array, struct or mapping types
// string is an array of bytes