# audioFormatExtended

## Description

AudioFormatExtended is the parent element, containing all the ADM elements.

## Example

```xml
<audioFormatExtended version=”ITU-R_BS.2076-3”>
  ...
</audioFormatExtended>
```

## Attributes

| Attribute  | Description                 | Example  | Required |
|------------|-----------------------------|----------|----------|
| version    | ADM Recommendation name and revision number | “ITU-R_BS.2076-3” | Yes |


## Sub-elements

| Element | Description | Quantity |
|---------|-------------|----------|
| [audioProgramme](audio_programme.md) | Description of the whole audio programme. | 0...* |
| [audioContent](audio_content.md) | Description of the content of some audio within the programme. | 0...* |
| [audioObject](audio_object.md) | The link between the actual audio tracks and their format. | 0...* |
| [audioPackFormat](audio_pack_format.md) | A description of a pack of channels that relate together. | 0...* |
| [audioChannelFormat](audio_channel_format.md) | A description of an audio channel. | 0...* |
| [audioStreamFormat](audio_stream_format.md) | A description of an audio stream. | 0...* |
| [audioTrackFormat](audio_track_format.md) | A description of an audio track. | 0...* |
| [audioTrackUID](audio_track_uid.md) | The unique identifier for an actual audio track. | 0...* |
| [profileList](profile_list.md) | Description of profile compliance. | 0 or 1 |
| [tagList](tag_list.md) | Descriptive text, keywords and shortnames for ADM elements. | 0 or 1 |

None of elements are mandatory within an ADM file. For example, a file that only consists of Common Definition tracks would not contain any `audioTrackFormat`, `audioStreamFormat`, `audioChannelFormat` and `audioPackFormat` elements. While it is preferable for ADM files to contain at least one `audioProgramme` and `audioContent` element, it is still valid for them to be omitted (for example in temporary or test files). 
