pragma solidity ^0.6.1;

import "../solidity/SafeMath.sol";

contract Escrow {
    using SafeMath for uint;

    address agent;
    mapping(address => uint256) public deposits;

    modifier onlyAgent() {
        require(msg.sender == agent);
        _;
    }

    constructor () public {
        agent = msg.sender;
    }
    
    function deposit(address payee) public onlyAgent payable {
        uint256 amount = msg.value;
        deposits[payee] = deposits[payee].add(amount);
    }

    function withdraw(address payable payee) public onlyAgent {
        uint256 payment = deposits[payee];
        deposits[payee] = 0;
        payee.transfer(payment);
    }
}