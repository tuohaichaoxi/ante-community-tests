// SPDX-License-Identifier: GPL-3.0-only

pragma solidity ^0.8.0;

import {AnteTest} from "../AnteTest.sol";
import {IERC20Metadata} from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";

// ==INSTRUCTIONS==
// TODO 1. Rename the contract and file in the form Ante[Target][Token]BalanceAbove[Threshold]Test
// TODO 2. Update target protocol, tokenholder address, token, and balance threshold (marked with TODO)
// TODO 3. Replace instances of [TOKEN], [HOLDER], and [THRESHOLD] as needed

/// @title Checks $[TOKEN] balance in [HOLDER] remains >= [THRESHOLD]
/// @author Put your ETH address here
/// @notice Ante Test to check
// TODO Change AnteTokenBalanceTestTemplate to the filename of the test,
contract AntedYdXTokenBalanceTest is AnteTest("dYdX Rewards Treasury doesn't drop 99%") {
    // TODO update tokenholder address and block explorer link
    // https://etherscan.io/address/0xb9431E19B29B952d9358025f680077C3Fd37292f
    address public constant HOLDER_ADDRESS = 0xb9431E19B29B952d9358025f680077C3Fd37292f;

    // TODO update token address and block explorer link
    // https://etherscan.io/address/0x92D6C1e31e14520e676a687F0a93788B716BEff5
    IERC20Metadata public constant TOKEN = IERC20Metadata(0x92D6C1e31e14520e676a687F0a93788B716BEff5);

    // Will be set to desired token balance threshold
    uint256 public immutable thresholdBalance;

    constructor() {
        // TODO replace (1000 * 1000) with desired threshold
        thresholdBalance = 2_000_000 * (10**TOKEN.decimals());

        // TODO replace "Protocol" with target protocol/wallet/etc.
        protocolName = "dYdX Governance";

        testedContracts = [address(TOKEN), HOLDER_ADDRESS];
    }

    /// @notice test to check if $[TOKEN] balance in [HOLDER] is >= [THRESHOLD]
    /// @return true if $[TOKEN] balance in [HOLDER] is >= [THRESHOLD]
    function checkTestPasses() public view override returns (bool) {
        return (TOKEN.balanceOf(HOLDER_ADDRESS) >= thresholdBalance);
    }
}
