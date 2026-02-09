# pagecustomization object
## Description
Never use pagecustomization objects for UI modifications but extend pages directly.
### ❌ Bad code
```AL
pagecustomization CustomerCardCust customizes "Customer Card"
{
    layout
    {
        ...
    }
}
```
### ✅ Good code
```AL
pageextension 50100 CustomerCardExt extends "Customer Card"
{
    layout
    {
        ...
    }
}
```