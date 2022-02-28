//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DogCoin is ERC20 {
    constructor() ERC20("DogCoin", "DOG") {}

    address[] public holders;

    function _afterTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual override {
        _addHolderIfNotExists(to);
        _deleteHolderIfBalanceZero(from);
    }

    function _addHolderIfNotExists(address account) internal {
        for (uint256 i = 0; i < holders.length; i++) {
            if (holders[i] == account) {
                return;
            }
        }
        holders.push(account);
    }

    function _deleteHolderIfBalanceZero(address account) internal {
        if (balanceOf(account) != 0) {
            return;
        }

        // swap and pop
        for (uint256 i = 0; i < holders.length; i++) {
            if (holders[i] == account) {
                holders[i] = holders[holders.length - 1];
                holders.pop();
                return;
            }
        }
    }
}
