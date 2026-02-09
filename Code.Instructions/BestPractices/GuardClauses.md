# guard clauses
## Description
Avoid 'if' nested for validation controls. All tests validation should be place at the begining of the procedure to improve readability.
### ❌ Bad code
```al
procedure calculateExample(Price: Decimal; Quantity: Decimal; TaxAmount: Decimal): Decimal
begin
    if Price <> 0 then begin 
        TotalAmount := Price * Quantity + TaxAmount;
        exit(TotalAmount);
        end;
end;
```
### ✅ Good code
```al
procedure calculateExample(Price: Decimal; Quantity: Decimal; TaxAmount: Decimal): Decimal
begin
    if Price = 0 then
        exit(0);

    TotalAmount := Price * Quantity + TaxAmount;
    exit(TotalAmount);
end;
```
