# audioContent

## Description

An `audioContent` element describes the content of one component of a programme (e.g. background music), and references one or more [`audioObject`](audio_object.md) elements to tie the content to its format. This element includes loudness metadata.

## Example

```xml
<audioContent audioContentID="ACO_1001"
              audioContentName="Music"
              audioContentLanguage="en">
  <audioContentLabel language="eng">Music</audioContentLabel>
  <audioContentLabel language="deu">Musik</audioContentLabel>            
  <audioObjectIDRef>AO_1001</audioObjectIDRef>
  <audioObjectIDRef>AO_1002</audioObjectIDRef>
  <loudnessMetadata loudnessMethod="ITU-R BS.1770" loudnessRecType="EBU R128">
    <integratedLoudness>-23.0</integratedLoudness>
  </loudnessMetadata>
  <dialogue nonDialogueContentKind="2">0</dialogue>
</audioContent>
```

## Attributes

| Attribute            | Description                 | Example  | Required |
|----------------------|-----------------------------|----------|----------|
| audioContentId       | ID of the content           | ACO_1001 | Yes      |
| audioContentName     | Name of the content         | Music    | Yes      |
| audioContentLanguage | Language of the content. It is recommended to use a language code to identify the language. The language code should be given as a 2- or 3-character code as specified by ISO 639-1 or ISO 639-2. Both ISO 639-2/B and ISO 639-2/T may be used. | en       | Optional |

## Sub-elements

| Sub-element      | Description                                                       | Example | Quantity |
|------------------|-------------------------------------------------------------------|---------|----------|
| [audioContentLabel](#audiocontentlabel) | The content description in the language specified by the language attribute. | "Music" | 0...* |
| audioObjectIDRef | Reference(s) to audioObject(s)                                    | AO_1001 | 1...*    |
| [loudnessMetadata](loudness_metadata.md) | Measured loudness of the content       |         | 0 or 1   |
| [dialogue](#dialogue) | Specifies the type of the content (non dialogue, dialogue, mixed) |    | 0 or 1   |
| alternativeValueSetIDref      | Reference to an alternativeValueSet within an audioObject | AVS_1001_0001 | 0...* |

As it is possible to include multiple `alternativeValueSetIDRef` sub-elements within an `audioContent` element, it shall be ensured that the `alternativeValueSetIDRef` only references one `alternativeValueSet` within the same `audioObject`. This should be done by inspecting the `alternativeValueSet` ID digits. The ID has the format: `AVS_wwww_zzzz`, where `wwww` matches the digits in the audioObject ID. Therefore, to ensure an `audioObject` is not referenced multiple times, each `alternativeValueSetIDRef` in an `audioContent` shall have unique `wwww` digits.

### audioContentLabel

The `audioContentLabel` is used to define a human-readable content label that may be displayed in an end-user device. Multiple labels can be defined for different language versions of the name in the label.   

| Attribute | Description | Type | Required |
| --------- | ----------- | ---- | -------- |
| language  | Used for definition of multiple audioContent labels in different languages. The language code should be given as a 2- or 3-character code as specified by ISO 639-1 or ISO 639-2. Both ISO 639-2/B and ISO 639-2/T may be used. | string | No (unless multiple labels are used) |

### dialogue

This optional sub-element specifies the kind of content that is included in the parent audioContent. The `dialogue` sub-element can take the values 0 (no dialogue), 1 (pure dialogue) or 2 (mixed). It has an attribute that specifies the type of content using defined lists (enumerators) of content kinds.
The attribute is dependent on the value of the `dialogue` sub-element.

| Value of dialogue	| Attribute |	Description	|
|---------------------|-----------|-------------|
| 0	| nonDialogueContentKind | ID of the contained content kind (enumerator, see specification below) |
| 1	| dialogueContentKind	| ID of the contained content kind (enumerator, see specification below) |
| 2	| mixedContentKind |ID of the contained content kind (enumerator, see specification below) |

#### Dialogue types
| nonDialogueContentKind | Description |
|------------------------|-------------|
| 0	                     | undefined   |
| 1	                     | music  |
| 2	                     | effect  |

| dialogueContentKind	   | Description  |
|------------------------|-------------|
| 0	                     | undefined  |
| 1	                     | (storyline) dialogue  |
| 2	                     | voiceover  |
| 3	                     | spoken subtitle  |
| 4	                     | audio description/visually impaired  |
| 5	                     | commentary  |
| 6	                     | emergency  |

| mixedContentKind 	     | Description  |
|------------------------|-------------|
| 0	                     | undefined  |
| 1	                     | complete main  |
| 2	                     | mixed  |
| 3	                     | hearing impaired  |
| 4                      | complete main with audio description |

