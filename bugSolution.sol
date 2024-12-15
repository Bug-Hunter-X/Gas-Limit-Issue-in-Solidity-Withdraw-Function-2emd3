```solidity
function withdraw(uint256 amount) public {
  require(amount <= balanceOf[msg.sender], "Insufficient balance");
  balanceOf[msg.sender] -= amount;
  (bool success, ) = payable(msg.sender).call{value: amount}("");
  require(success, "Transfer failed.");
}
```
This revised function uses the `call` function with the low-level call data which gives more control over gas usage and error handling. The `require(success, "Transfer failed.");` statement ensures that the transaction was successful.