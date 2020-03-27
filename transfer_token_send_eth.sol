pragma solidity ^0.6.1;

contract TransferTokens {
    //buy a token
    // send ether to the walet
    mapping(address => uint256) public balances;
    address payable walet;

    event Purchase (address indexed _buyer, uint256 _amount);

    constructor(address payable _walet) public {
        walet = _walet;
    }

    function() external payable {
        buyToken();
    }
    function buyToken() public payable {
        // buy Token
        balances[msg.sender] +=1;
        //send ether to the walet
        walet.transfer(msg.value);
        emit Purchase(msg.sender, 1);
    }

}