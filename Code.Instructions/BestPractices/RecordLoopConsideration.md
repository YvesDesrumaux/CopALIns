# Record Loop Consideration
## Description
- Use `SetRange`/`SetFilter` Before `FindSet()`: Limit record sets before processing
- Use `FindSet()` with `Repeat`-`Until`: For looping through records
## ❌ Bad code
```al
    repeat
        if (Salesline.Type)= Salesline.Type::Item) then begin
            // Process each record
        end;
    until SalesLine.Next() = 0;
```
## ✅ Good code
```al
   SalesLine.SetRange("Type", Salesline.Type::Item);
   if SalesLine.FindSet() then
       repeat
           // Process each record
       until SalesLine.Next() = 0;
```