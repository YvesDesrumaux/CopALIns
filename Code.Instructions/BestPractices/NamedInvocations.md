# Named Invocations
## Description
When calling an object statically use the Object Name, not the Object Id.
## ❌ Bad code
```al
    Page.RunModal(525, SalesShptLine);
```
## ✅ Good code
```al
    Page.RunModal(Page::"Posted Sales Shipment Lines", SalesShptLine);
```