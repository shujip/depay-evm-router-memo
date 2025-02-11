import '@nomiclabs/hardhat-waffle'
import '@nomiclabs/hardhat-ethers'
import '@typechain/hardhat'

import dotenv from 'dotenv'
dotenv.config()

var {
  MNEMONIC,
  ETHEREUM_RPC_URL,
  POLYGON_RPC_URL,
  BSC_RPC_URL,
  BSC_RPC_API_KEY,
} = process.env

const sharedConfig = {
  solidity: {
    version: '0.8.6',
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  }
}

export {
  sharedConfig,
  MNEMONIC,
  ETHEREUM_RPC_URL,
  POLYGON_RPC_URL,
  BSC_RPC_URL,
  BSC_RPC_API_KEY,
}
