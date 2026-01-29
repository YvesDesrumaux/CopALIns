# Text Constants and Localization
## Description
- Use labels for all user-facing strings to support localization
- Define text constants at the beginning of the procedure where they are used. Avoid duplicate by definig at the begining of codeunit or page if text constants have multiple use.
- Use descriptive names for text constants that indicate their purpose
- When using StrSubstNo, always use a text constant or label for the format string
- Format text constant names as: ErrorMsg, ConfirmQst, InfoLbl, etc.
- Avoid hardcoded strings in error messages and notifications
- Use numbered placeholders (%1, %2, etc.) in labels, and comment their usage
### ❌ Bad code
```al
begin
    ErrorMessage := StrSubstNo('Field type mismatch: %1 field cannot be mapped to %2 field.', Format(CustomFieldType), Format(TargetFieldType));
    ...
end;
```
### ✅ Good code
```al
var
    TypeMismatchErr: Label 'Field type mismatch: %1 field cannot be mapped to %2 field.',
                     comment = '%1 = Customer Field Type, %2 = Target Field Type';
begin
    ErrorMessage := StrSubstNo(TypeMismatchErr, Format(CustomFieldType), Format(TargetFieldType));
    ...
end;
```
