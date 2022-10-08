// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

// 0. message to sign
// 1. hash(message)
// 3. sign(hash(message), private key) | done offchain using wallet
// 4. ecrecover(hash(message), signature) == signer