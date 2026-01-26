# One Statement per Line
## Description
A line of code should not have more than one statement.
## Example 1
### ❌ Bad code
```al
    if OppEntry.Find('-') then exit;  
```
### ✅ Good code
```al
    if OppEntry.Find('-') then   
        exit;  
```
## Example 2
### ❌ Bad code
```al
    TotalCost += Cost; TotalAmt += Amt;  
```
### ✅ Good code
```al
    TotalCost += Cost; 
    TotalAmt += Amt;
```