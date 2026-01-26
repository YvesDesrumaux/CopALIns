# Begin as an afterword
## Description
When `begin` follows `then`, `else`, `do`, it should be on the same line, preceded by one space character.

## ❌ Bad code
```al
    if ICPartnerRefType = ICPartnerRefType::"Common Item No." then
    begin
        ...
    end;
```

## ✅ Good code
```al
    if ICPartnerRefType = ICPartnerRefType::"Common Item No." then begin
        ...
    end;
```