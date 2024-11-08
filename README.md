# FA24CYBR8470C4Model
to modify and render the [EHR model as code](./EHR.dsl) in this repository look into [Structurizer Lite](https://docs.structurizr.com/lite/installation) or signup to use the [cloud service](https://www.structurizr.com/products)


## Diagrams

### C4 Models
#### Context (EHR1)
![](./Models/structurizr-97226-SystemContext-001.png)
#### Container (EHR2)
![](./Models/structurizr-97226-Container-001.png)
#### Component (ProviderPortal)
![](./Models/structurizr-97226-Component-002.png)


### MITRE ATT&CK mapping table
| **Diagram**    | **Architectural Element** | **Tactic** | **Potential ATT&CK Technique**    | **Description** | **Required Mitigations**|
| -------- | ------- | -------- | ------- | -------- | ------- |
|  EHR2  | Patient Portal  | **Credential Access/Collection**    | **Input Capture (T1056)** | The use of 3rd party tools on an external to capture patients inputs into their portal.| None |
|  ProviderPortal  | Authentication Protocols  | **Priviledge Escalation**    | **Access Token Manipulation (T1134)** | User may be able to modify their token so to spoof a different user type.| M1026, M1018|