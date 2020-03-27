#%%
import json
from web3 import Web3
# Fill in your infura API key here:
infura_url = "https://mainnet.infura.io/v3/03fb8e7884384cd5839b0ac8d2c3fff7"
web3 = Web3(Web3.HTTPProvider(infura_url))

# print(web3.eth.blockNumber)

# latest = web3.eth.blockNumber
# print(latest)
# print(web3.eth.getBlock(latest))

# for i in range(0, 10):
#     print(web3.eth.getBlock(latest - i))
# get info from 
hash = '0xf1adda44ea2737fe6d2bf7a00d2eb7f1225c10edd9e44e5a07f02c29c6ea87d0'
print(web3.eth.getTransactionByBlock(hash, 2))