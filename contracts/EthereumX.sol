pragma solidity ^0.4.11;

contract EthereumX is StandardToken {

    function () {
        //if ether is sent to this address, send it back.
        throw;
    }

    /* Public variables of the token */
    string public name;                   
    uint8 public decimals;                
    string public symbol;                 
    string public version = 'H1.0';      

    function EthereumX(
        ) {
        balances[msg.sender] = 5000000000000000000000000;               
        totalSupply = 5000000000000000000000000;                       
        name = "Ethereum X";                                  
        decimals = 18;                            
        symbol = "ETHX";                             
    }

    /* Approves and then calls the receiving contract */
    function approveAndCall(address _spender, uint256 _value, bytes _extraData) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);

        //receiveApproval(address _from, uint256 _value, address _tokenContract, bytes _extraData)
        //it is assumed that when does this that the call *should* succeed, otherwise one would use vanilla approve instead.
        if(!_spender.call(bytes4(bytes32(sha3("receiveApproval(address,uint256,address,bytes)"))), msg.sender, _value, this, _extraData)) { throw; }
        return true;
    }
}