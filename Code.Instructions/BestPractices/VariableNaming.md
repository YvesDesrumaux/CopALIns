# Variable Naming
## Description
Variables that refer to a AL object must contain the objects name, abbreviated where necessary.

PascalCase is always used for variable names.

Blanks, periods, and other characters (such as parentheses) that would make quotation marks around a variable necessary must be omitted.

## Example 1
### ❌ Bad code
```al
    WIPBuffer: Record "Job WIP Buffer"
```
### ✅ Good code
```al
    JobWIPBuffer: Record "Job WIP Buffer"    
```
## Example 2
### ❌ Bad code
```al
    Postline: Codeunit "Gen. Jnl.-Post Line";    
```
### ✅ Good code
```al
    GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
```
## Example 3
### ❌ Bad code
```al
    "Amount (LCY)": Decimal;    
```
### ✅Good code
```al
    AmountLCY: Decimal;        
```