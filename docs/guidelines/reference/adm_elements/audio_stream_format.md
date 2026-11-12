# audioStreamFormat

## Description

A stream is a combination of tracks (or one track) required to render a channel, object, HOA component or pack. The `audioStreamFormat` establishes a relationship between [`audioTrackFormat`](audio_track_format.md)s and the [`audioChannelFormat`](audio_channel_format.md)s or [`audioPackFormat`](audio_pack_format.md). Its main use is to deal with non-PCM encoded tracks, where one or more [`audioTrackFormat`](audio_track_format.md)s must be combined to represent a decodable signal that covers several [`audioChannelFormat`](audio_channel_format.md)s (by referencing an [`audioPackFormat`](audio_pack_format.md)). For PCM audio, the `audioStreamFormat` should be omitted. If they are not omitted, the `audioStreamFormat` will refer to a single [`audioTrackFormat`](audio_track_format.md) and a single [`audioChannelFormat`](audio_channel_format.md).

Software that reads ADM files should be aware that existing ADM files (based on Recommendation ITU-R BS.2076-2 and earlier) for PCM audio may contain a single `audioStreamFormat` elements that reference a single `audioTrackFormat` and a single `audioChannelFormat` element. If so, then the yyyyxxxx parts of AT_yyyyxxxx_zz, AS_yyyyxxxx, and AC_yyyyxxxx should be identical.

## Example

```xml
<audioStreamFormat audioStreamFormatID="AS_00031001"
                   audioStreamFormatName="PCM_Dialogue1"
                   formatLabel="0001" formatDefinition="PCM">
  <audioChannelFormatIDRef>AC_00031001</audioChannelFormatIDRef>
  <audioTrackFormatIDRef>AT_00031001_01</audioTrackFormatIDRef>
</audioStreamFormat>
```

## Attributes

| Attribute            | Description                 | Example  | Required |
|----------------------|-----------------------------|----------|----------|
| audioStreamFormatName | Name of the stream | PCM_FrontLeft | Yes |
| audioStreamFormatID | ID for the stream. The yyyy digits of AS_yyyyxxxx represent the type of audio contained in the stream. The xxxx digits should match the audioChannelFormat xxxx digits. | AS_00010001 | Yes |
| formatLabel | Descriptor of the format | 0001 | Optional |
| formatDefinition | Description of the format | PCM | Optional |

\* At least one of formatLabel or formatDefinition is required.


## Sub-elements

| Element | Description | Example | Quantity |
|---------|-------------|---------|----------|
| audioChannelFormatIDRef | Reference to audioChannelFormat | AC_00010001 | 0 or 1 |
| audioPackFormatIDRef | Reference to audioPackFormat | AP_00010003 | 0 or 1 |
| audioTrackFormatIDRef | Reference to audioTrackFormat | AT_00010001_01 | 0…* |

**IMPORTANT:** Only one of `audioPackFormatIDRef` or `audioChannelFormatIDRef` can be used, not both in the same element.
