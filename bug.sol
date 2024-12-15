```solidity
function withdraw(uint256 amount) public {
  require(amount <= balanceOf[msg.sender], "Insufficient balance");
  balanceOf[msg.sender] -= amount;
  payable(msg.sender).transfer(amount);
}
```
This code has a subtle bug related to the use of `transfer`. The `transfer` function has a gas limit of 2300 gas units. If the amount being withdrawn requires more gas than this to execute, the transaction will fail, reverting the state changes and leaving the user's funds locked.