# Object Naming
## Description
- Use PascalCase for all identifiers
- Create descriptive names that clearly indicate the purpose
- Avoid abbreviations unless they names are too long (max 30 caracters including prefix)
- Be consistent with naming patterns throughout the codebase
- Blanks, periods, and other characters (such as parentheses) that would make quotation marks around a variable necessary must be omitted.

### Tables and Fields
- Table names should be singular nouns
- Field names should clearly describe the data they contain
- Boolean fields should be named with a positive assertion (e.g., "Is Complete" not "Not Complete")

### Pages
- List pages should be named with the plural form of the entity
- Card pages should be named with "Card" suffix
- Document pages should be named with the document type

### Codeunits
- Codeunits implementing business logic should be named after the functionality they provide
- Utility codeunits should have a suffix indicating their purpose (e.g., "Mgt" for management)
- Event subscriber codeunits should have "Event Subscribers" in their name

### Reports
- Report names should clearly indicate their purpose and output
- Processing reports should include "Processing" in their name