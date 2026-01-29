# Copilot Instructions — AL Templates

## Purpose
This folder contains practical, copy-paste ready templates for common AL development scenarios in Business Central. These templates implement the standards and patterns defined in the SharedGuidelines and follow Business Central Version 27.0 best practices.

## General rules
- Language Language used in caption, messages, text constant or end user information are in english and must be reveland for the end user

## Available Templates

### [Table Template](./table-template.al)
Complete table creation template with:
- Field Naming Identifiers on fields on tables should not have a prefix
- Field Caption If field's name and caption are similar then remove the caption property
- Proper field data appropriate field types for the data they will contain
- Proper field structure with tooltips starting with "Specifies" and ending with "."
- Data classification Table and fields must have a Dataclassification property according to the use of the data field. Except if DataClassification field equal to the Table's DataClassification then removed the property's field to reduce redundancy
- Validation triggers with business logic patterns.
- FlowFields and keys following performance guidelines. Primary keys having only field must have NotBlank property set to true on the field.
- Standard triggers (OnInsert, OnModify, OnDelete, OnRename)
- Enum definition for status fields
- Fieldgroups for DropDown and Brick displays

**Usage:**
1. Copy the template file
2. Separte objects in different files
3. Replace `[ObjectID]`, `[Prefix]`, `[EntityName]` with your values
4. Customize fields, validation logic, and business rules
5. Add specific FlowFields and relationships as needed

### [Table Extension Template](./tableextension-template.al)
Complete table creation template with:
- Field Naming Identifiers on fields on tables must have a prefix
- Field Caption Fields Caption are mandatory
- Proper field data appropriate field types for the data they will contain
- Proper field structure with tooltips starting with "Specifies" and ending with "."
- Data classification Fields must have a Dataclassification property according to the use of the data field.
- Validation triggers with business logic patterns.
- FlowFields and keys following performance guidelines. Primary keys having only field must have NotBlank property set to true on the field.
- Standard triggers According to the business logic

**Usage:**
1. Copy the template file
2. Separte objects in different files
3. Replace `[ObjectID]`, `[Prefix]`, `[EntityName]` with your values
4. Customize fields, validation logic, and business rules
5. Add specific FlowFields and relationships as needed

### [Page Templates](./page-template.al)
Complete page creation templates including:
#### Pages best practises
- No implicit Rec is allowed
- Identifiers of fields and actions must not be prefixed
- Layout defined before the actions
- Actions with Processing, Navigation, and Reporting areas
- Promoted actions using actionref syntax (no PromotedCategory)
- Fields Tooltips should be on table fields not on the page fields
- Group related fields together
- FastTabs for organizing content

#### Card Page Template
- Proper layout with General, Details, and Statistics groups
- FactBoxes with related information and system parts
- Field validation and UI interaction patterns
- ApplicationArea set to All for the page

#### List Page Template  
- Repeater control with proper field selection
- Bulk operations and selection handling
- Export capabilities to Excel and reports
- FactBox integration for additional information
- Style expressions for visual indicators

#### API Page
- `ApplicationArea`, `Caption`, `UsageCategory` properties are not requiered on API Pages
- Control names in API pages use camelCase
- `Extensible = false;` is always present in header page properties
- Groups are not allowed

**Usage:**
1. Copy the relevant page template
2. Replace `[ObjectID]`, `[Prefix]`, `[EntityName]` with your values
3. Customize fields, actions, and business logic
4. Add specific FactBoxes and related pages

### [Page Extension Template](./pageextension-template.al)
Complete page extension creation templates including:
- No implicit Rec is allowed
- Identifiers of fields and actions must be prefixed
- Layout defined before the actions
- Actions with Processing, Navigation, and Reporting areas
- Promoted actions using actionref syntax (no PromotedCategory)
- Fields Tooltips should be on table fields not on the page fields
- Group related fields together
- FastTabs for organizing content

**Usage:**
1. Copy the template file
2. Replace `[ObjectID]`, `[Prefix]`, `[EntityName]` with your values
3. Customize fields, validation logic, and business rules
4. Add specific FlowFields and relationships as needed

### [Codeunit Templates](./codeunit-template.al)
- Procedures must follow the Single Responsibility Principle (SRP)
- Procedures Names must not be prefixed
- Check for IsGuiAllowed() before using any GUI functions

Two comprehensive codeunit patterns:
#### Management Codeunit (`[Prefix]_[EntityName]Mgt`)
- CRUD operations with validation and error handling
- Business logic procedures following Single Responsibility Principle
- Event publishers for extensibility (OnBefore/OnAfter patterns)
- Event subscribers for table events
- Batch processing with progress indication
- Statistics and helper functions**

#### Workflow Codeunit (`[Prefix]_[EntityName]Workflow`)
- Multi-stage workflow processing with comprehensive error handling
- Business event patterns for major functionality
- Integration events for external system connectivity
- Progress tracking and user notification
- Validation and business rule enforcement**

**Usage:**
1. Choose Management template for simple operations, Workflow for complex processes
2. Replace `[ObjectID]`, `[Prefix]`, `[EntityName]` with your values
3. Implement specific business logic in the marked areas
4. Add custom validation rules and processing steps

### [Reports and Report Extensions](./report-template.al)
Guidelines:
- Use appropriate data items and columns
- Implement proper filtering options
- Use request pages for user input
- Follow standard Business Central report layouts
- Implement proper error handling
- Use processing-only reports for data manipulation without output
- Optimize report performance for large datasets (Queries can be used as data source)

### XMLPorts
- Use proper element and attribute naming
- Implement proper validation for imported data
- Handle errors gracefully
- Document the expected XML structure
- Implement proper encoding and character handling
- Consider performance for large XML files

### Queries
- Use appropriate filters and sorting
- Optimize for performance
- Document the purpose and usage of the query
- Consider using queries for complex data retrieval operations
- Implement proper security filtering

### [Test Template](./test-template.al)
Comprehensive test codeunit template with:
- Complete test coverage for CRUD operations
- Arrange-Act-Assert pattern for all test methods
- Test data generation with X prefix following TestingValidation standards
- Performance testing patterns with timing validation
- Event testing for subscribers and publishers
- Error scenario testing with asserterror patterns
- Test handlers for UI interactions (Confirm, Message, Page handlers)
- Test isolation and cleanup procedures

**Usage:**
1. Copy the test template
2. Replace `[ObjectID]`, `[Prefix]`, `[EntityName]` with your values
3. Add specific test scenarios for your business logic
4. Implement test data creation helpers
5. Add custom validation assertions

## Template Replacement Guide

### Common Placeholders
Replace these placeholders throughout the templates:

| Placeholder       | Description               | Example                                        |
| ----------------- | ------------------------- | ---------------------------------------------- |
| `[ObjectID]`      | Your object ID number     | `50100`                                        |
| `[Prefix]`        | Your extension prefix     | `abcABC`                                          |
| `[EntityName]`    | Your business entity name | `Customer Rating`                              |
| `[KeyParameters]` | Method parameters         | `CustomerNo: Code[20]; Description: Text[100]` |
| `[Related Table]` | Related table name        | `ABC Customer Rating Detail`                   |
| `[Key Field]`     | Foreign key field         | `Customer Rating No.`                          |

### Example Transformation
**From Template:**
```al
table [ObjectID] "[Prefix]_[EntityName]"
{
    Caption = '[EntityName]';
    // ...
}
```

**To Implementation:**
```al
table 50100 "abcABC_CustomerRating"
{
    Caption = 'Customer Rating';
    // ...
}
```

## Business Central 27.0 Features

These templates leverage the latest AL features including:
- Modern enum syntax for status fields
- Improved error handling patterns
- Performance optimization with SetLoadFields
- Enhanced event patterns for extensibility
- Current UI patterns with proper actionref syntax
- Data classification compliance
- Accessibility standards implementation

## Getting Started

1. **Choose the appropriate template based on your development scenario
2. **Copy the template file to your AL project directory
3. **Replace all placeholders with your specific values
4. **Customize business logic according to your requirements
5. **Test thoroughly using the test template patterns
6. **Review compliance with SharedGuidelines standards

These templates provide a solid foundation for AL development while ensuring consistency with the established workflow standards and Business Central best practices.