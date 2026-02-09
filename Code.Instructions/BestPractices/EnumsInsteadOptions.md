# Use Enums Instead of Options
## Description
Always use enums instead of the deprecated option data type.
### ✅ Good code
```al
   enum 50100 DocumentStatus
   {
        Extensible = true;  // Always make extensible unless there's a specific reason not to

        value(0; " ") { Caption = ' '; }  // Include blank value when appropriate
        value(1; Open) { Caption = 'Open'; }
        value(2; "Pending Approval") { Caption = 'Pending Approval'; }
        value(3; Approved) { Caption = 'Approved'; }
        value(4; Rejected) { Caption = 'Rejected'; }
   }

```
### Exception
- When calling existing procedures that use option parameters
- When subscribing to events that use option parameters
