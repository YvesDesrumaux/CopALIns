# Captions
# Description
- All Captions are in English and must be meaningful for end users
- Use meaningful and user-friendly captions for table, fields, actions, and controls
- Avoid technical jargon in captions; aim for clarity and simplicity
- Ensure consistency in terminology across captions to maintain a cohesive user experience
- Review and update captions regularly to reflect any changes in functionality or user interface
- Use sentence case for captions (only the first letter of the first word capitalized, except for proper nouns)
- Captions on fields are mandatory when the field name is not meaningful for end users (contains affixes or technical terms)
- Remove captions on fields when the field name is identical to the caption
- Captions are mandatory on all enums, actions, and controls to enhance user understanding, usability, and accessibility.
- Caption are not mandatory on table fields if the field name is already meaningful for end users (and do not contain affixes or technical terms)
### ❌ Bad code
```al
    field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            Editable = false;
        }
```
### ✅ Good code
```al
    field(1; "Code"; Code[10])
        {
            Editable = false;
        }
```