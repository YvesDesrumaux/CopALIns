# Nested IF-THEN-ELSE
## Description
Use CASE instead of nested IF-THEN-ELSE when comparing the same variable against multiple values.
## ❌ Bad code
```al
   if Type = Type::Item then
       ProcessItem()
   else if Type = Type::Resource then
       ProcessResource()
   else
       ProcessOther();
```
## ✅ Good code
```al
   case Type of
       Type::Item:
           ProcessItem();
       Type::Resource:
           ProcessResource();
       else
           ProcessOther();
   end;
```