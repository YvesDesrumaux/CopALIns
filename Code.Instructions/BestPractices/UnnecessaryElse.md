# Unnecessary Else
## Description
`else` should not be used when the last action in the `then` part is an `exit`, `break`, `skip`, `quit`, `error`. 
## ❌ Bad code
```al
    procedure SomeProcedure()
    begin
        if IsAdjmtBinCodeChanged() then
            Error(AdjmtBinCodeChangeNotAllowedErr, ...)
        else
            Error(BinCodeChangeNotAllowedErr, ...);
    end;
```
## ✅ Good code
```al
    procedure SomeProcedure()
    begin
        if IsAdjmtBinCodeChanged() then
            Error(AdjmtBinCodeChangeNotAllowedErr, ...)
        Error(BinCodeChangeNotAllowedErr, ...);
    end;
```