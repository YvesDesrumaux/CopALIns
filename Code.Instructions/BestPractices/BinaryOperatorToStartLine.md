# Binary Operator to Start Line
## Description
Do not start a line with a binary operator.
## ❌ Bad code
```AL
"Quantity to Ship" :=
    Quantity 
    - "Quantity Shipped"
```
## ✅ Good code
```AL
"Quantity to Ship" :=
    Quantity -
    "Quantity Shipped"
```