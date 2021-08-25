# Objective

1. Become owner

# Instance

`0x5D16a704d61431bfBd9750889B543DD5352f599A`

# Ramblings 

1. Objective is to become the owner, but no `owner = XXYY` present.
2. Note function `sendAllocation` allows anyone to retrieve other person's allocation
3. Note function `allocate` allocates only for you.

# Solution
1. Ahhh, the classic `function` is the constructor. No no.
2. Anyone can just call `Fallout()` it is just another method, _not_ the constructor.
3. Good lord they named it `Fal1out` so autocomplete wouldn't help I guess? I don't know.
4. Ah, no, it is a hint, I think. Because in Solidity <= 0.4.22 constructors have the same name as the contract. Anyway...
5. The next step is obvious just call the false constructor.

```
await contract.Fal1out();
console.assert(await contract.owner() == player);
```



# Learned

* Names are stupid. And solidity was a silly language.
* Solidity now uses `constructor` like a person but previously it just relayed on names.
