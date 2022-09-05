//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {
    string[] public tokens = ["BTC", "ETH"];
    address[] public players;
    
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function start() public {
        players.push(msg.sender);
    }

    function concatenate(string memory s1, string memory s2) public pure returns(string memory) {
        return string.concat(s1, s2);
        // return string(abi.encodePacked(s1, s2));
    }

    function changeTokens() public {
        string[] storage t = tokens;
        t[0] = "VET";
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function transferAll(address payable _address) public {
        require(msg.sender == owner, "ONLY_OWNER");
        uint balance = getBalance(); 
        _address.transfer(balance);
    }

    receive() external payable {}
}
