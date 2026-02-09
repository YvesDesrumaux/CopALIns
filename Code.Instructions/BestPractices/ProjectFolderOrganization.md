# Project Folder Organization
## Description
- Respect existing organization if files objects are existing
- Objects are placed in modules folders
- Folders names are representative on the feature and in PascalCase
- if an object is concerned by several modules, it should be placed in a "Common" folder
### Principle
    AppMain
    |_ Common
            |_ EventSubscribers.Codeunit.al 
    |_ Module1
            |_ Module1.Table.al
            |_ Module1.Page.al
            |_ Module1.Codeunit.al
            |_ Module1.Report.al
    |_ Module2
    |_ Module3
    |_ app.json
    |_ appSourceCop.json

### Exemple
    AppMain
    |_ Common
            |_ EventSubscribers.Codeunit.al
    |_ Setup
            |_ MySetup.Table.al
    |_ Sales
            |_ SalesManagement.Codeunit.al
            |_ SalesInvoice.report.al
    |_ Purchase
            |_ PurchaseManagement.Codeunit.al
    |_ DropShipment
    |_ Manufacturing
    |_ app.json
    |_ appSourceCop.json
