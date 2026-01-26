# Seperate if and else
## Description
`if` and `else` statements should be on separate lines.
## ❌ Bad code
```al
    if Atom = '>' then HasLogicalOperator := true else begin
        ...
    end;
```
## ✅ Good code
```al
    if Atom = '>' then
        HasLogicalOperator := true
    else begin
        ...
    end;
```