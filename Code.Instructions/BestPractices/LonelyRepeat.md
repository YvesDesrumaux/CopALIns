* Lonely Repeat
## Description
The `repeat` statement should always be alone on a line.
## ❌ Bad code
```al
    if ReservEntry.FindSet() then repeat
```
## ✅ Good code
```al
    if ReservEntry.FindSet() then 
        repeat
```