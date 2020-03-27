#%%
import json
from web3 import Web3
# connect to ganache
ganache_url = "http://127.0.0.1:7545"
web3 = Web3(Web3.HTTPProvider(ganache_url))


web3.eth.defaultAccount = web3.eth.accounts[0]

# load smart contract 
abi = json.loads('[{"constant":false,"inputs":[{"name":"_greeting","type":"string"}],"name":"setGreeting","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"greet","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"greeting","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"inputs":[],"payable":false,"stateMutability":"nonpayable","type":"constructor"}]')

# deployed Contract address
address = web3.toChecksumAddress("0x27394C8f72f06ce63C6A7b559C9D4411B521B8E5")

# collect smartcontract
contract = web3.eth.contract(address=address, abi=abi)
# call smartcontract
print(contract.functions.greet().call())
# change smartcontract
tx_hash = contract.functions.setGreeting('New greeting').transact()
print(tx_hash)

web3.eth.waitForTransactionReceipt(tx_hash)
print('Updated greeting:{}'.format(
    contract.functions.greet().call()
))