# Begin-End - Compound Only
## Description
Only use begin..end to enclose.

## Example 1
### ❌ Bad code
```AL
if FindSet() then begin
    repeat
        ...
    until next() = 0;
end;
```
### ✅ Good code
```AL
if FindSet() then
    repeat
        ...
    until next() = 0;
```
## Example 2
### ❌ Bad code
```AL
if IsAssemblyOutputLine then begin
    TestField("Order Line No.", 0);
end;
```
### ✅ Good code
```AL
if IsAssemblyOutputLine then
    TestField("Order Line No.", 0);
```
## Exception
```AL
// Except for this case
if X then begin
    if Y then 
        //DO SOMETHING;
end else 
    (not X)
```