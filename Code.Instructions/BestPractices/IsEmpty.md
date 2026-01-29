# Implement Proper existing record test
## Description
- Use Record.IsEmpty() instead of Record.FindSet() or Record.FindFirst() if the queried record is not used
## ❌ Bad code
```al
    if not Customer.FindSet() then 
        message('No customer found);
```
## ✅ Good code
```al
    if Customer.IsEmpty() then 
        message('No customer found);
```