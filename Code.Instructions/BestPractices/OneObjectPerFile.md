# One Object per File
# Description
A file must content only one AL object
### ❌ Bad code
```al
tableextension 50100 CustomerExt extends Customer
{
  ...
}
enum 50111 CustomerStatus
{
  ...
}
```
### ✅ Good code
```al
tableextension 50100 briAAA_CustomerExt extends Customer
{
  ...
}
```
and in another file
```al
enum 50111 CustomerStatus
{
  ...
}
```