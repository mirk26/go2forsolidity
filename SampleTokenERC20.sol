pragma solidity 0.7.0;

contract PracticeToken {
    
    address public owner;
    string public name = "PracticeToken";
    string public symbol = "$PT$";
    uint8 public decimals = 10;
    uint256 public totalSupply;
    uint256 decimalfactor = 10 ** uint256(decimals);
    uint256 public Max_Token = 1000000 * decimalfactor;

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor () public {
        owner = msg.sender;
        totalSupply = Max_Token;
        balanceOf[owner] = Max_Token;
    }
    
    function returnTotalSupply()public view returns (uint256){
        return totalSupply; 
    }

    function returnBalanceOf(address _owner) public view returns (uint256 balance) {
        return balanceOf[_owner];
    }
    function _transfer(address _from, address _to, uint _value) internal {
        require(_to != address(0));
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        
        emit Transfer(_from, _to, _value);
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        _transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= allowance[_from][msg.sender], "Allowance error");
        allowance[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        return true;
    }
    
}
