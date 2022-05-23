# Play with ERC20 's transfer functions
Note:
- `TestToken`: an extended ERC20 token contract.
- `TestTokenExecuter`: contract to deploy `TestToken` contract and contain some functions to transfer tokens from Admin (`TestTokenExecuter` 's owner) to other accounts. 
**Warning**: `TestToken` contract should be deployed by another contract, e.g., `TestTokenExecuter`.
