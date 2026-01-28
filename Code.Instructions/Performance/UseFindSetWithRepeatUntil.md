# Use FindSet() with Repeat-Until
## Description
Use FindSet() with Repeat-Until: For looping through records

## ❌ Bad code
```al
   if SalesLine.FindFirst() then
       repeat
           // Process each record
       until SalesLine.Next() = 0;
```
## ✅ Good code
For looping through records
   ```al
   if SalesLine.FindSet() then
       repeat
           // Process each record
       until SalesLine.Next() = 0;
   ```