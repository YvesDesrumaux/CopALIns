# Objects Prefix
# Description
- All objects must have a prefix
- The prefix is always in this format '<affix><separator>' where:
  - the <affix> is defined as an AppSourceCop.json file property.
  - The <separator> is a single character (e.g., underscore '_' for Main extension, or equal '=' for test extensions)
- The prefix is generally 6 characters and always 3 first characters in lowercase and the next characters in uppercase
- The prefix is always just once in the object name
- The prefix is always in the beginning of the object name
### ❌ Bad code
```al
tableextension 50100 CustomerExt extends Customer
```
### ✅ Good code
```al
tableextension 50100 briAAA_CustomerExt extends Customer
```