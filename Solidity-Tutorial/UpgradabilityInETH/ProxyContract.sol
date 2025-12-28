// Upgradibility using Proxy Pattern in Solidity

pragma solidity ^0.8.13;

contract StorageProxy {
    uint public num;
    address implementation;

    constructor(address _implementation) {
        num = 0;
        implementation = _implementation;
    }

    function setNum(uint _num) public {
        (bool success, ) = implementation.delegatecall(
            abi.encodeWithSignature("setNum(uint256)", _num)
        );
        require(success, "Delegatecall failed");
    }

    function setImplementation(address _implementation) public {
        implementation = _implementation;
    }
}
contract ImplemenatationV1 {
    uint public num;

    function setNum(uint _num) public {
        num = _num;
    }
}

contract ImplemenatationV2 {
    uint public num;

    function setNum(uint _num) public {
        num = _num * 2;
    }
}

contract ImplemenatationV3 {
    uint public num;

    function setNum(uint _num) public {
        num = _num * 3;
    }
}
