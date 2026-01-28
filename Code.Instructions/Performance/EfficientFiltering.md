# Minimize Database Operations Through Efficient Filtering
## Description
- Use appropriate filters before reading records
- Use SetLoadFields() to load only needed fields
- Use SetRange/SetFilter with indexed fields when possible
- Prefer using FindSet() than FindFirst() for a loop
- Avoid using FindFirst() without filters