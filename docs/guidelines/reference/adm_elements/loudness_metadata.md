# loudnessMetadata

These elements describe the measured loudness of the programme or content.

## Example

```xml
<loudnessMetadata loudnessMethod="ITU-R BS.1770" loudnessRecType="EBU R128" loudnessCorrectionType="file">
  <integratedLoudness>-24.0</integratedLoudness>
  <loudnessRange>12.5</loudnessRange>
  <maxTruePeak>-5.2</maxTruePeak>
  <maxMomentary>-9.9</maxMomentary>
  <maxShortTerm>-18.3</maxShortTerm>
  <renderer uri="urn:itu:bs:2127:0:itu_adm_renderer">
    <audioPackFormatIDRef>AP_00010002</audioPackFormatIDRef>
    <audioObjectIDRef>AO_1001</audioObjectIDRef>
  </renderer>
</loudnessMetadata>
```

## Elements

The `loudnessMetata` element contains these attributes and sub-elements:

| Attribute | Description | Type | Required | Example |
| --------- | ----------- | ---- | -------- | ------- |
| loudnessMethod | The method or algorithm used to calculate the loudness. | string | No | "ITU-R BS.1770" |
| loudnessRecType | The RecType indicates which regional recommended practice was followed in the loudness correction of the audio. | string | No | "EBU R128" |
| loudnessCorrectionType | The correction type is used to indicate what correction the audio, for example, file-based or real-time. | string | No | "File-based" |


| Sub-element | Description | Type | Units | Example | Quantity |
| ----------- | ----------- | ---- | ----- | ------- | -------- |
| integratedLoudness | Integrated loudness value | float | LKFS/LUFS | -23.0 | 0 or 1 |
| loudnessRange | Loudness range | float | LU | 10.0 | 0 or 1 |
| maxTruePeak | Maximum true-peak | float | dBTP | -2.3 | 0 or 1 |
| maxMomentary | Maximum momentary loudness | float | LKFS/LUFS | -19.0 | 0 or 1 |
| maxShortTerm | Maximum short-term loudness | float | LKFS/LUFS | -21.2 | 0 or 1 |
| dialogLoudness | Loudness of the average dialogue | float | LKFS/LUFS | -24.0 | 0 or 1 |
| [renderer](#renderer) | Defines the renderer configuration that has been used for the measurement of the other sub-elements in the parent loudnessMetadata element. | - | - | - | 0 or 1 |

### renderer

| Attribute | Description | Example | Required |
| --------- | ----------- | ---- | -------- |
| uri | Renderer uri used in production and monitoring.  | urn:itu:bs:2127:0:itu_adm_renderer | Yes |
| name | Renderer name used in production and monitoring.  | "Rec, ITU-R BS.2127" | No |
| version | Version number of the renderer. | "1.0.0" | No |
| coordinateMode | Specifies the coordinate system path used during rendering, irrespective of the underlying composition coordinate system. Allowable values are “polar” or “cartesian”. | "polar" | No |

| Sub-element                   | Description                                              | Example  | Quantity |
|-------------------------------|----------------------------------------------------------|----------|----------|
| audioPackFormatIDRef | Reference to an audioPackFormat element of type ‘0001’ (DirectSpeakers). This sub-element defines the loudspeaker layout that has been used for rendering. | AP_00010003 | 0 or 1 |
| audioObjectIDRef | Reference to audioObject elements. This sub-element can be used to define audioObject elements that have been used for rendering. | AO_1001 | 0...* |


