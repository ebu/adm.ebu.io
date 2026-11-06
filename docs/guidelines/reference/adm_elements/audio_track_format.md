# audioTrackFormat

## Description

The `audioTrackFormat` element corresponds to a single set of samples or data in a single track in a storage medium. It is used to describe what format the data is in, allowing a renderer to decode the signal correctly. It is referred from the [`audioStreamFormat`](audio_stream_format.md) element, which is used to identify the combination of tracks required to decode the track data successfully.

For PCM audio an [`audioStreamFormat`](audio_stream_format.md) will refer to a single `audioTrackFormat` and so the two elements are effectively describing the same thing. In this case, the `audioTrackFormat` and the [`audioStreamFormat`](audio_stream_format.md) should be omitted. Then the [`audioTrackUID`](audio_track_uid.md) shall refer to the corresponding `audioChannelFormat`. For coded audio, multiple `audioTrackFormat`s will have to be combined in a single [`audioStreamFormat`](audio_stream_format.md) to generate decodable data.

Software that parses the model can start from either `audioTrackFormat` or [`audioStreamFormat`](audio_stream_format.md). To allow for this flexibility `audioTrackFormat` can also refer back to the [`audioStreamFormat`](audio_stream_format.md). However, it is a strict requirement that if this reference is used, the `audioTrackFormat` must refer to the same [`audioStreamFormat`](audio_stream_format.md) that is referring back to it.


## Example

```xml
<audioTrackFormat audioTrackFormatID="AT_00010001_01"
                  audioTrackFormatName="PCM_FrontLeft"
                  formatDefinition="PCM" formatLabel="0001">
  <audioStreamFormatIDRef>AS_00010001</audioStreamFormatIDRef>
</audioTrackFormat>
```

## Attributes

| Attribute            | Description                 | Example  | Required |
|----------------------|-----------------------------|----------|----------|
| audioTrackFormatName | Name of the track | PCM_FrontLeft | Yes |
| audioTrackFormatID | ID for track. The yyyy digits of AT_yyyyxxxx_nn represent the type of audio contained in the track. The yyyyxxxx digits should match the audioStreamFormat yyyyxxxx digits. The nn digits represent the track number (starting at 1) within the stream. | AT_00010001_01 | Yes |
| formatLabel | Descriptor of the format | 0001 | Optional |
| formatDefinition | Description of the format | PCM | Optional |

\* At least one of formatLabel or formatDefinition is required.


## Sub-elements

| Element | Description | Example | Quantity |
|---------|-------------|---------|----------|
| audioStreamFormatIDRef | Reference to an audioStreamFormat | AS_00010001 | 1 |
