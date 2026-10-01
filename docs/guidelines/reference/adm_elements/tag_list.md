# tagList

## Description

The `tagList` element contains one or more `tagGroup` sub-elements. Each `tagGroup` sub-element defines a group of one or more `tag`s which are associated with one or more ADM elements.

## Example

```xml
<tagList>
  <tagGroup>
    <tag class="format">Stereo</tag>
    <tag class="program genre">Sport</tag>
    <audioProgrammeIDRef>APR_1001</audioProgrammeIDRef>
  </tagGroup>
  <tagGroup>
    <tag class="format">NGA 5.1+2dialogues</tag>
    <tag class="program genre">News</tag>
    <audioProgrammeIDRef>APR_1002</audioProgrammeIDRef>
    <audioProgrammeIDRef>APR_1003</audioProgrammeIDRef>
  </tagGroup>
  <tagGroup>
    <tag class="format">NGA 5.1+2dialogues</tag>
    <tag class="program genre">News</tag>
    <audioProgrammeIDRef>APR_1004</audioProgrammeIDRef>
    <audioProgrammeIDRef>APR_1005</audioProgrammeIDRef>
  </tagGroup>
  <tagGroup>
    <tag class="dialogue type">boosted dialogue</tag>
    <audioObjectIDRef>AO_1012</audioObjectIDRef>
    <audioObjectIDRef>AO_1013</audioObjectIDRef>
  </tagGroup>
</tagList>
```

## Sub-elements

| Element | Description | Example | Quantity |
|---------|-------------|---------|----------|
| [tagGroup](#taggroup) | A group of tag elements and any associated ADM elements. | | 1...* |

The `tag` sub-element can be used to attach descriptive text, keywords and short names to selected ADM elements. Application standards and profiles may define a restricted controlled vocabulary for tag values. Applications may use tag values for automatic selection, discarding, and searching of ADM elements. For example, tag values for an `audioProgramme` element can be used to define a target platform and/or playback environment for the `audioProgramme`. Tag values can be also used to indicate features of ADM elements. 

The values of the `tag` sub-elements and their `class` attributes provide additional information and shall not influence the way ADM elements are parsed or interpreted. Additionally, the contents of the tag elements shall not be used to duplicate or replace any other existing ADM elements.

## tagGroup

### Sub-elements

| Element | Description | Example | Quantity |
|---------|-------------|---------|----------|
| [tag](#tag-attributes) | The tag value. | "mobile", "effects", "1" | 1...* |
| audioProgrammeIDRef | Reference to an audioProgramme element associated with the tag sub-elements. | "APR_1001" | 0...* |
| audioContentIDRef | Reference to an audioContent element associated with the tag sub-elements. | "ACO_1001" | 0...* |
| audioObjectIDRef | Reference to an audioObject element associated with the tag sub-elements. | "AO_1001" | 0...* |

In each `tagGroup` element, there shall be at least one `audioProgrammeIDRef` sub-element or at least one `audioContentIDRef` sub-element or at least one `audioObjectIDRef` sub-element. 

### tag Attributes 

| Attribute  | Description                 | Example      | Required |
|------------|-----------------------------|--------------|----------|
| class | Used to assign the tag to a category | "platform", "layer" | No |

