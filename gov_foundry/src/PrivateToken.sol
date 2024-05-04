// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract PrivateToken is ERC20, Ownable, ERC20Permit {
    mapping(address account => bool) private _locked;

    constructor(address initialOwner)
        ERC20("PrivateToken", "PVT")
        Ownable()
        ERC20Permit("PrivateToken")
    {}

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }

    function transfer(address to, uint256 value) public virtual override returns (bool) {
        require(_locked[msg.sender] == false,"Tokens are locked can not transfer");
        return super.transfer(to,value);
    }

    function approve(address spender, uint256 value) public virtual override returns (bool) {
        require(_locked[msg.sender] == false, "Tokens are locked can not approve tokens");
        return super.approve(spender,value);
    }

    function transferFrom(address from, address to, uint256 value) public virtual override returns (bool) {
        require(_locked[from] == false,"Tokens are locked can not transfer from");
        return super.transferFrom(from, to, value);
    }

    function _spendAllowance(address owner, address spender, uint256 value) internal virtual override {
        require(_locked[owner] == false,"Tokens are locked can not spend allowance");
        super._spendAllowance(owner, spender, value);
    }

    
    /* returns true if successfully locked false for everything else*/
    function lock(address addr) public returns (bool) {
        if(_locked[addr] == false){
            _locked[addr] = true;
            // emit Locked(addr);
            return true;
        }
        return false;
    }

    /* returns true if successfully unlocked false for everything else*/
    function unlock(address addr) public returns (bool) {
        if(_locked[addr]){
            _locked[addr] = false;
            // emit Unlocked(addr);
            return true;
        }
        return false;
    }

    /* returns true if users tokens are locked*/
    function isLocked(address addr) public view returns (bool){
        return _locked[addr];
    }
}