# profileList

## Description

The `profileList` shall represent which constraint specifications the ADM is compliant with. If multiple profile elements are present, then the ADM is constrained by the most constrained parts of each profile.

## Example

```xml
<profileList>
  <profile profileName="EBU Production Profile" profileVersion="1.0" profileLevel="1">EBU Tech 3393</profile>
</proflleList>
```

## Sub-elements

| Element | Description | Example | Quantity |
|---------|-------------|---------|----------|
| [profile](#profile-attributes) | Each profile specification shall specify how the profile string shall be set for the respective profile. It shall indicate a reference (e.g., a document reference) to the respective profile to which the ADM metadata is compliant. | "ITU-R BS.XXXX | 1...* |

## profile Attributes

| Attribute  | Description                 | Example      | Required |
|------------|-----------------------------|--------------|----------|
| profileName | The profileName attribute string shall be set for the respective profile. It shall indicate the name of the respective profile to which the ADM metadata is compliant. | "EBU Production Profile" | Yes |
| profileVersion | The profileVersion attribute string shall be set for the respective profile. It shall indicate the version of the respective profile to which the ADM metadata is compliant. | "1.0" | Yes |
| profileLevel | The profileLevel attribute string shall be set for the respective profile. It shall indicate the level of the respective profile to which the ADM metadata is compliant. | "1" | Yes |
