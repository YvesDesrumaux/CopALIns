# Comment Spacing
## Description
- Add comments to explain complex logic or business rules
- Document the purpose of procedures, parameters, and return values
- Always start comments with // followed by one space character.
## ❌ Bad code
```al
procedure CalculateTotalAmount(DocumentType: Enum "Sales Document Type"; DocumentNo: Code[20]): Decimal
begin
    RowNo += 1000; //Move way below the budget  
```
## ✅ Good code
```al
/// <summary>
/// Calculates the total amount for a sales document.
/// </summary>
/// <param name="DocumentType">The type of the sales document.</param>
/// <param name="DocumentNo">The number of the sales document.</param>
/// <returns>The total amount of the sales document.</returns>
procedure CalculateTotalAmount(DocumentType: Enum "Sales Document Type"; DocumentNo: Code[20]): Decimal
begin
  RowNo += 1000; // Move way below the budget
```