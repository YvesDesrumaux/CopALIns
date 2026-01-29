# Event-Based Integration
## Description
Events can be used for loose coupling and integration purpose.

## Events Coding
- Use event publishers and subscribers for loose coupling between modules
- Implement proper event handling with clear documentation
- Follow the standard event naming conventions:
  - OnBefore[Action]
  - OnAfter[Action]
  - On[Action]
- Use business events for integration points that may be consumed by other extensions