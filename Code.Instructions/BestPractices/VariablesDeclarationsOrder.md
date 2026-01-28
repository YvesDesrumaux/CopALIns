# Variables Declarations Order
## Description
Variables declarations should be ordered by type. In general, object and complex variable types are listed first followed by simple variables. The order should be:

- Record
- Report
- Codeunit
- XmlPort
- Page
- Query
- Notification
- BigText
- DateFormula
- RecordId
- RecordRef
- FieldRef
- FilterPageBuilder
- Other types (Text, Integer, Decimal, etc.)

(Ref: [Microsoft Docs](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/analyzers/codecop-aa0021))

When several variables have the same type, then they are sort by alphabetical order.

## ❌ Bad code
```al
    StartingDateFilter: Text;
    EndingDateFilter: Text;
    Vendor: Record Vendor;
```
## ✅ Good code
```al
    Vendor: Record Vendor;
    EndingDateFilter: Text;
    StartingDateFilter: Text;
```