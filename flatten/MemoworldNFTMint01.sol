// Dependency file: contracts/interfaces/IMemoworldNFT.sol

// SPDX-License-Identifier: MIT

// pragma solidity >=0.8.6 <0.9.0;

interface IMemoworldNFT {
  function mint(
    address account,
    uint256 id,
    uint256 amount,
    bytes memory data
  ) external payable;
}


// Root file: contracts/MemoworldNFTMint01.sol


pragma solidity >=0.8.6 <0.9.0;
pragma abicoder v2;

// import {IMemoworldNFT} from 'contracts/interfaces/IMemoworldNFT.sol';

contract MemoworldNFTMint01 {
  // Address representating ETH (e.g. in payment routing paths)
  address public constant ETH = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;

  // Indicates that this plugin requires delegate call
  bool public immutable delegate = true;
  address public constant MemoworldContract = 0x4908b9381606C34EaF4ea24C01Eb66CBAB2bc749;

  event RouteMint(address indexed sender, uint256 indexed tokenId, uint256 indexed amount);

  constructor() {}

  function execute(
    address[] calldata path,
    uint256[] calldata amounts,
    address[] calldata addresses,
    string[] calldata data
  ) external payable returns (bool) {
    IMemoworldNFT memoContract = IMemoworldNFT(MemoworldContract);

    memoContract.mint{value: amounts[1]}(addresses[0], amounts[5], amounts[6], bytes(''));

    emit RouteMint(addresses[0], amounts[5], amounts[6]);

    return true;
  }
}
