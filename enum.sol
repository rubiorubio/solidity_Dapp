pragma solidity ^0.6.1;

contract Enum {
    enum State {Waiting, Ready, Active} // дан список
    State public state;

    constructor() public {
        state = State.Waiting; // по умолчанию он waiting
    }

    function activate() public {
        state = State.Active;// после вызова он активируется
    }

    function isActive() public view returns(bool) {
        return state == State.Active; // возращает значение если он активен в true
    }
}