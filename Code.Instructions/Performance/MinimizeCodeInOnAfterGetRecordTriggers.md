# Minimize Code in OnAfterGetRecord Triggers
## Description
- Move complex calculations to separate procedures
- Use CurrPage.Update(false) to avoid unnecessary refreshes
- Consider using background tasks for heavy calculations