# Tooltips
# Description
- All fields should have tooltips to provide context and guidance to users
- Use the Tooltip property in AL to define tooltips for fields, actions, and controls
- Ensure tooltips are concise and informative, helping users understand the purpose and usage of each field or action
- Avoid overly technical jargon in tooltips; aim for clarity and simplicity
- Use consistent terminology and phrasing across tooltips to maintain a cohesive user experience
- Review and update tooltips regularly to ensure they reflect any changes in functionality or user interface
- Tooltips on fields must start with 'Specifies' to maintain consistency and clarity
- Tooltips always end with a '.'
- Tooltips in pages are only relevant when they are different than the field tooltip they are linked to or for actions.
### ❌ Bad code
```al
    Tooltip = 'Give the customer Code'
```
### ✅ Good code
```al
    Tooltip = 'Specifies the No. of the customer.'
```