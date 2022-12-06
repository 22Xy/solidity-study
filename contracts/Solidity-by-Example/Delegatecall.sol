// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// NOTE: Deploy this contract first
contract B {
    // NOTE: storage layout must be the same as contract A
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract A {
    // even if the type does not match, it can also be set.
    bool public firstValue;
    address public secondValue;
    uint public thirdValue;

    function setVars(address _contract, uint _num) public payable {
        // A's storage is set, B is not modified.
        // it doesn't look at the variable name but only look at storage slots ([0], [1], etc.)
        // it can set the value of storage slot even though there is no variables
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }

    // function setVars(uint _num) public payable {
    //     // num = _num;
    //     // storageSlot[0] = _num;
    //     firstValue = _num;
    //     // storageSlot[1] = msg.sender;
    //     secondValue = msg.sender;
    //     // storageSlot[2] = msg.value;
    //     thirdValue = msg.value;
    // }
}