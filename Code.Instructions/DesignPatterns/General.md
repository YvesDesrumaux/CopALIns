# General Design Patterns
## Description
This document outlines the basic coding standards, patterns, and style guidelines for AL development in Business Central

## Coding Style
- Use PascalCase for public and private members (objects, fields, methods)
- Create descriptive names for all objects and elements
- Use object IDs in appropriate ranges defined in app.json
- Follow Microsoft's official AL style guide
- Implement proper indentation and spacing for readability (4 spaces)
- Keep lines under 120 characters when possible
- Empty lines should be used to separate logical code blocks
- Prefer early exits in procedures to reduce nesting and improve readability
- Use guard clauses to make all validation at the beginning of a procedure
- Use `exit` to return from a procedure when necessary
- Always use explicit record references when accessing fields
- Always use the `this` qualifier when accessing object properties within methods of the same object
- Delete variables that are declared but not used in the code

## AL Development Patterns
- Use the extension model instead of direct base application modifications
- Leverage event publishers and subscribers for integration points
- Encapsulate business logic in codeunits
- Use table and page extensions for modifying existing functionality
- Implement optimized data access patterns (SetLoadFields, limited record fetching)
- Apply proper error handling with meaningful error messages
- Follow modular design principles for maintainability
- Implement proper permission sets for security
- Use AL's object-based architecture with appropriate object types
- Add telemetry for diagnostic purposes