# End else pair
## Description
The `end else` pair should always appear on the same line.
## ❌ Bad code
```al
    if OppEntry.FindLast() then
        if SalesCycleStage.FindLast() then begin
            ...
        end
        else
        begin
            ... 
        end;
```
## ✅ Good code
```al
    if OppEntry.FindLast() then
        if SalesCycleStage.FindLast() then begin
            ...
        end else begin
            ...
        end;
```