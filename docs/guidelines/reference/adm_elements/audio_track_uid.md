# audioTrackUID

## Description

The `audioTrackUID` uniquely identifies a track or asset within a file or recording of an audio scene. This element contains information about the bit-depth and sample-rate of the track. For PCM audio, the [`audioStreamFormat`](audio_stream_format.md) and the [`audioTrackFormat`](audio_track_format.md) should be omitted; then the `audioTrackUID` shall refer to the corresponding [`audioChannelFormat`](audio_channel_format.md). The `audioTrackUID` element also contains sub-elements that allow the model to be used for non-BW64 applications by performing the job of the <chna> chunk. 

## Example

```xml
<audioTrackUID UID="ATU_00000001" sampleRate="48000" bitDepth="24">
  <audioTrackFormatIDRef>AT_00010001_01</audioTrackFormatIDRef>
  <audioPackFormatIDRef>AP_00010002</audioPackFormatIDRef>
</audioTrackUID>
```

## Attributes

| Attribute  | Description                 | Example      | Required |
|------------|-----------------------------|--------------|----------|
| UID        | The actual UID value        | ATU_00000001 | Yes      |
| sampleRate | Sample rate of track in Hz  | 48000        | Optional |
| bitDepth   | Bit depth of track in bit   | 24	          | Optional |

## Sub-elements

| Element               | Description                                                   | Example        | Quantity |
|-----------------------|---------------------------------------------------------------|----------------|----------|
| _audioMXFLookUp_ (Deprecated) | This sub-element was deprecated in Rec. ITU-R BS.2076-3 and therefore shall not be used. Other methods to package ADM into MXF exist and shall be used. sub-section |                | 0   |
| audioTrackFormatIDRef | Reference to an audioTrackFormat description                  | AT_00010001_01 | 0 or 1   |
| audioPackFormatIDRef  | Reference to an audioPackFormat description                   | AP_00010002    | 0 or 1   |
