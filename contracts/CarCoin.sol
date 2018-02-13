pragma solidity ^0.4.19;

import "browser/ERC20.sol";
import "browser/SafeMath.sol";

contract CarCoin {
string public constant symbol = "CAR";
string public constant name = "CarCoin";
uint8 public constant decimals = 18;

    uint private constant __totalSupply = 100;
    mapping (address => uint) private __balanceOf;
    mapping (address => mapping (address => uint256)) internal allowed;


    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

    function public CarCoin() {
        __balanceOf[msg.sender] = __totalSupply;
    }

    function totalSupply() public constant returns (uint _totalSupply) {
        _totalSupply = __totalSupply;
    }

    function balanceOf(address _owner) public constant returns (uint balance) {
        return __balanceOf[_owner];
    }

  function transfer(address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[msg.sender]);


    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    Transfer(msg.sender, _to, _value);
    return true;
  }


    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require(_to != 0x0);
        uint _allowance = allowed[_from][msg.sender];

        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);

        // _allowance.sub(_value) will throw if _value > _allowance
        allowed[_from][msg.sender] = _allowance.sub(_value);
        Transfer(_from, _to, _value);

        return true;

  }


    function approve(address _spender, uint _value) public returns (bool success) {
       allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public constant returns (uint remaining) {
        return allowed[_owner][_spender];
    }

    function increaseApproval(address _spender, uint _addedValue) public returns (bool) {
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_addedValue);
        Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

     function decreaseApproval(address _spender, uint _subtractedValue) public returns (bool) {
    uint oldValue = allowed[msg.sender][_spender];
    if (_subtractedValue > oldValue) {
      allowed[msg.sender][_spender] = 0;
    } else {
      allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
    }
    Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

}
