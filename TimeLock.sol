pragma solidity ^0.6.1;

contract Timelock {
    // who can withdraw?
    // how much?
    // When?
    address payable public beneficiary;
    uint256 public releaseTime;

    constructor(address payable _beneficiary, uint256 _releaseTime) public payable {
        require(_releaseTime > block.timestamp,"Now Time"); // больше чем сейчас
        beneficiary = _beneficiary;
        releaseTime = _rexleaseTime;
    }

    function release() public {
        require(block.timestamp >= releaseTime);
        address payable (beneficiary).transfer(address(this).balance);
    }
}