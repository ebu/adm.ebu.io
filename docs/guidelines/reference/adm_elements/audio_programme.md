# audioProgramme

## Description

The `audioProgramme` is the top level element in the ADM structure. An `audioProgramme` represents an entire programme, or a version of a programme. A file can contain more than one `audioProgramme`, though it is recommended that they are all different versions of the same programme (e.g. different language versions), rather than completely different programmes.

An `audioProgramme` element references one or more [`audioContent`](audio_content.md) elements that are combined to create a full programme. It contains start and end times for the programme, which can be used for alignment with video times. Loudness metadata is also included to allow the programme’s loudness to be recorded. There is also provision to include information about the dimensions of the screen used in production, should it be required (obviously not for audio only productions).

When more than one `audioProgramme` is included in a file, and there is no other information to decide which one to choose for playback, then the default `audioProgramme` is the one with the lowest ID value.

## Example

In the example below, the programme called "Documentary" is set with a start time of 00:10:00.00000 and an end time of 00:40:00.00000. It contains three [`audioContent`](audio_content.md) sub-elements, loudness and reference screen metadata.
There's two `audioProgrammeLabel` sub-elements provide different language names. 

```xml
<audioProgramme audioProgrammeID="APR_1001"
                audioProgrammeName="Documentary"
                start="00:10:00.00000" end="00:40:00.00000">
  <audioProgrammeLabel language="eng">Default Mix</audioProgrammeLabel>
  <audioProgrammeLabel language="deu">Standard Mix</audioProgrammeLabel>
  <audioContentIDRef>ACO_1001</audioContentIDRef>
  <audioContentIDRef>ACO_1002</audioContentIDRef>
  <audioContentIDRef>ACO_1003</audioContentIDRef>
  <loudnessMetadata>
     <integratedLoudness>-23.0</integratedLoudness>
  </loudnessMetadata>
  <audioProgrammeReferenceScreen aspectRatio="1.778">
    <screenCentrePosition X="0.0" Y="1.0" Z="0.2"/>
    <screenWidth X="0.3"/>
  </audioProgrammeReferenceScreen>
  <authoringInformation>
    <renderer uri=“urn:itu:bs:2127:0:itu_adm_renderer”>
      <audioPackFormatIDRef>AP_00010003</audioPackFormatIDRef>
      <audioPackFormatIDRef>AP_00010017</audioPackFormatIDRef>
    </renderer>
  </authoringInformation>
</audioProgramme>
```

## Attributes

| Attribute              | Description                 | Example        | Required |
|------------------------|-----------------------------|----------------|----------|
| audioProgrammeId       | ID of the programme         | APR_1001       | Yes      |
| audioProgrammeName     | Name of the programme       | My Programme   | Yes      |
| audioProgrammeLanguage | Language of the programme   | en             | No       |
| start                  | Start time of the programme | 00:10:00.00000 | No       |
| end                    | End time of the programme   | 00:11:00.00000 | No       |
| maxDuckingDepth        | Maximum of allowed ducking  |                | No       |

## Sub-elements

| Sub-element                   | Description                                              | Example  | Quantity |
|-------------------------------|----------------------------------------------------------|----------|----------|
| [audioProgrammeLabel](#audioprogrammelabel) | The programme description in the language specified by the language attribute. | "News" | 0...* |
| audioContentIDRef             | Reference(s) to audioContent(s)                          | ACO_1001 | 1...*    |
| [loudnessMetadata](loudness_metadata.md)   | Measured loudness of the programme          |          | 0 or 1   |
| [audioProgrammeReferenceScreen](#audioprogrammereferencescreen) | Specification of a reference/production/monitoring screen size for the audioProgramme. If the reference screen-size is not given, a default screen-size is implicitly defined. |          | 0 or 1   |
| [authoringInformation](#authoringinformation) | | | 0 or 1|
| alternativeValueSetIDref      | Reference to an alternativeValueSet within an audioObject | AVS_1001_0001 | 0...* |

### audioProgrammeLabel

The `audioProgrammeLabel` is used to define a human-readable programme label that may be displayed in an end-user device. Multiple labels can be defined for different language versions of the name in the label.   

| Attribute | Description | Type | Required |
| --------- | ----------- | ---- | -------- |
| language  | Used for definition of multiple audioProgramme labels in different languages. The language code should be given as a 2- or 3-character code as specified by ISO 639-1 or ISO 639-2. Both ISO 639-2/B and ISO 639-2/T may be used. | string | No (unless multiple labels are used) |

### audioProgrammeReferenceScreen

| Attribute | Description | Required | Example |
| --------- | ----------- | -------- | ------- |
| aspectRatio | Aspect ratio of the screen (proportional relationship between its width and its height (with respect to the image dimensions)) | No | 1.6 |


| Sub-element | Description | Type | Quantity |
| ------- | ----------- | ---- | -------- |
| [screenCentrePosition](#screencentreposition) | Position of the centre of the screen | screenCentrePositionType | 0 or 1 |
| [screenWidth](#screenwidth) | Width of the screen | screenWidthType | 0 or 1 |


### screenCentrePosition

| Attribute | Description | Type | Required |
| --------- | ----------- | ---- | -------- |
| azimuth | Azimuth of the centre of the screen | float | No |
| elevation | Elevation of the centre of the screen | float | No |
| distance | Distance of the centre of the screen | float | No |
| X | X position of the centre of the screen | float | No |
| Y | Y position of the centre of the screen | float | No |
| Z | Z position of the centre of the screen | float | No |


### screenWidth

| Attribute | Description | Type | Required |
| --------- | ----------- | ---- | -------- |
| azimuth | Azimuth measure of screen width | float | No |
| X | X measure of screen width | float | No |


### authoringInformation

| Sub-element                   | Description                                              | Example  | Quantity |
|-------------------------------|----------------------------------------------------------|----------|----------|
| [referenceLayout](#referencelayout) | The reference layout describes the loudspeaker layout for which the content of the audioProgramme was originally produced for. In that sense it represents the optimal loudspeaker layouts from the content creator's point of view. |  | 0...* |
| [renderer](#renderer) |  | | 0...* |

### referenceLayout

| Sub-element                   | Description                                              | Example  | Quantity |
|-------------------------------|----------------------------------------------------------|----------|----------|
| audioPackFormatIDRef | Reference to an audioPackFormat used as the reference layout during production. The referenced layout can either be part of the Common Definitions in Recommendation ITU-R BS.2094 or contained in the local ADM code itself. In case a reproduction technique is used during production that makes use of a virtual loudspeaker setup (e.g. binaural rendering or soundbar rendering), the referenceLayout should reference the virtual loudspeaker layout. | AP_00010003 | 1 |

### renderer

| Attribute | Description | Example | Required |
| --------- | ----------- | ---- | -------- |
| uri | Renderer uri used in production and monitoring.  | urn:itu:bs:2127:0:itu_adm_renderer | Yes |
| name | Renderer name used in production and monitoring.  | "Rec, ITU-R BS.2127" | No |
| version | Version number of the renderer. | "1.0.0" | No |
| coordinateMode | Specifies the coordinate system path used during rendering, irrespective of the underlying composition coordinate system. Allowable values are “polar” or “cartesian”. | "polar" | No |

| Sub-element                   | Description                                              | Example  | Quantity |
|-------------------------------|----------------------------------------------------------|----------|----------|
| audioPackFormatIDRef | Reference to an audioPackFormat used in production and monitoring. | AP_00010003 | 1...* |
