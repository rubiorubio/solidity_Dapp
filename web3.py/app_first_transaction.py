#%%
from web3 import Web3
# connect to ganache
ganache_url = "http://127.0.0.1:7545"
web3 = Web3(Web3.HTTPProvider(ganache_url))

# print(web3.isConnected())
# print(web3.eth.blockNumber)

account_1 = "0xCDc38ffe7Aa77c59ffC309b48e6Bd2818aA7Fe0B"
account_2 = "0x734a1E3e35b7baa528585Bb70fcDe3124205f766"

private_key_1 = "ce1db1dc3c8fdaa5c2f93d49f2d0ebff6cb4a90a0731947bd224f71248d3ce84"

# get nonce
nonce = web3.eth.getTransactionCount(account_1)
# get a nonce (number that can only be used once)
# build a transaction
tx = {
    'nonce'   : nonce,
    'to'      : account_2,
    'value'   : web3.toWei(10,'ether'),
    'gas'     : 2000000,
    'gasPrice': web3.toWei('50','gwei')

}
# sign transaction
signed_tx = web3.eth.account.signTransaction(tx, private_key_1)

# send transaction
tx_hash = web3.eth.sendRawTransaction(signed_tx.rawTransaction)
print(web3.toHex(tx_hash))
# get transaction hash