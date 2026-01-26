# Variable and Parameter Naming
## Description
- Use PascalCase for all identifiers (objects, variables, parameters, methods)
- Create descriptive names that clearly indicate the purpose
- Avoid abbreviations unless they names are too long
- Be consistent with naming patterns throughout the codebase
- Blanks, periods, and other characters (such as parentheses) that would make quotation marks around a variable necessary must be omitted.

### Record Variables
Names of variables and parameters of type `Record` should be suffixed with the table name without whitespaces. For multiple variables of the same record type, use meaningful suffixes.

### ✅ Good code
```al
// Basic record variable naming
procedure ProcessCustomer()
var
    Customer: Record Customer;
    SalesHeader: Record "Sales Header";
    SalesLine: Record "Sales Line";
begin
    // Implementation
end;

// Multiple variables of the same type - use descriptive suffixes
procedure TransferBetweenCustomers()
var
    SourceCustomer, TargetCustomer: Record Customer;
    TempCustomer: Record Customer temporary;
begin
    // Transfer logic implementation
end;

// Complex scenario with related records
procedure AnalyzeCustomerSales()
var
    Customer, FilterCustomer: Record Customer;
    SalesHeader: Record "Sales Header";
    SalesLine: Record "Sales Line";
    ItemLedgerEntry: Record "Item Ledger Entry";
    TempSalesAnalysis: Record "Sales Analysis" temporary;
begin
    // Analysis implementation
end;

// Working with extensions and base tables
procedure ProcessCustomerRatings()
var
    Customer: Record Customer;  // Base table
    CustomerRating: Record "ABC Customer Rating";  // Extension table
    TempCustomerSummary: Record "Customer Summary" temporary;
begin
    // Rating processing logic
end;
```

### Page Variables
- Names of variables and parameters of type `Page` should be suffixed with the page name without whitespaces
### ❌ Bad code
```al
JobPage: Page Job;
```
### ✅ Good code
```al
JobPage: Page Job;
```

### Multiple Variables of Same Type
- If there is a need for multiple variables or parameters of the same type, the name must be suffixed with a meaningful name
- the variables are separated by colon and a space before the type declaration
### ❌ Bad code
```al
Customer1: Record Customer;
Customer2: Record Customer;
```
### ✅ Good code
```al
CustomerNew, CustomerOld: Record Customer;
```

### Parameter Declaration
- A parameter must only be declared as `var` if necessary (when the parameter needs to be modified)


















## Example 1
### ❌ Bad code
```al
    WIPBuffer: Record "Job WIP Buffer"
```
### ✅ Good code
```al
    JobWIPBuffer: Record "Job WIP Buffer"    
```
## Example 2
### ❌ Bad code
```al
    Postline: Codeunit "Gen. Jnl.-Post Line";    
```
### ✅ Good code
```al
    GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
```
## Example 3
### ❌ Bad code
```al
    "Amount (LCY)": Decimal;    
```
### ✅Good code
```al
    AmountLCY: Decimal;        
```