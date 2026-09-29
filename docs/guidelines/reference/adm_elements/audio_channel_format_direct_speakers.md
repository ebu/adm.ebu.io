# audioChannelFormat - DirectSpeakers

## Description

An `audioChannelFormat` represents a single sequence of audio samples on which some action may be performed, such as movement of an object, which is rendered in a scene. It contains one or more [`audioBlockFormat`](#audioblockformat)s, which sub-divide it in the time domain.

The [`typeDefinition`](type_definitions.md) described here is for the 'DirectSpeakers' type, which is used for traditional channel-based audio. Many `audioChannelFormat` definitions with the 'DirectSpeakers' type are already defined in the [_Common Definitions_](../../tutorial/common_definitions.md), so they do not need to be defined explicitly when generating ADM metadata.

The other types of `audioChannelFormat`s are:

* [Matrix](audio_channel_format_matrix.md)
* [Objects](audio_channel_format_objects.md)
* [HOA](audio_channel_format_hoa.md)
* [Binaural](audio_channel_format_binaural.md)

## Example

```xml
<audioChannelFormat audioChannelFormatID="AC_00010001"
                    audioChannelFormatName="FrontLeft"
                    typeLabel="0001" typeDefinition="DirectSpeakers">
  <audioBlockFormat audioBlockFormatID="AB_00010001_00000001">
    <speakerLabel>urn:itu:bs:2051:0:speaker:M+030</speakerLabel>
    <position coordinate="azimuth">30.0</position>
    <position coordinate="elevation">0.0</position>
    <position coordinate="distance">1.0</position>
  </audioBlockFormat>
</audioChannelFormat>
```

## Attributes

The common [`audioChannelFormat` attributes](audio_channel_format.md#common-attributes) are used for the [`typeDefinition`](type_definitions.md) 'DirectSpeakers'.

## Sub-elements

The common [`audioChannelFormat` sub-elements](audio_channel_format.md#common-sub-elements) are used for the [`typeDefinition`](type_definitions.md) 'DirectSpeakers'.

## audioBlockFormat

In addition to the common [`audioBlockFormat` attributes](audio_channel_format.md#audioblockformat) the following sub-elements are defined for the `audioBlockFormat` with [`typeDefinition`](type_definitions.md) 'DirectSpeakers'.

### Sub-elements

| Element | Description	   | Example | Quantity |
|---------|----------------|---------|----------|
| speakerLabel | A reference to the label of the speaker position | M-30 | 0...* |
| cartesian | Specifies coordinate system, if the flag is set to 1 the Cartesian coordinate system is used, otherwise spherical coordinates are used. Default of 0 (spherical) | 1 | 0 or 1 |
| [position](#position) | Location of sound | −30.0 | 1...6 |

#### position (Spherical coordinates)

| Attribute	| Value	| Description | Required | Units for position sub-element value |
|-----------|-------|-------------|----------|--------------------------------|
| coordinate | azimuth | Defining the azimuth of position | Yes* | Degrees |
| coordinate | elevation | Defining the elevation of position | No* | Degrees |
| coordinate | distance | Defining the distance of position | No* | Normalised to 1 |
| bound | max | Maximum range of position value | No | - |
| bound | min | Minimum range of position value | No | - |
| [screenEdgeLock](#screenedgelock-attribute) | left, right, top, bottom  | Defines a speaker position at a screen edge	| No | - |

If no `bound` attribute is used the the position is the exact value specified.

*If spherical coordindates are used then the `azimuth` coordinate must be used, but the other coordinates are optional. `elevation` has a default of 0 degrees, and `distance` has a default of 1.

The distance measure is normalised, as absolute speaker distances from the origin are rarely used, but an absolute reference distance is available in `audioPackFormat`.

#### position (Cartesian coordinates)

| Attribute	| Value	| Description | Required | Units for position sub-element value |
|-----------|-------|-------------|----------|--------------------------------|
| coordinate | X | Defining the X axis of position | Yes* | Relative units (-1.0 to 1.0) |
| coordinate | Y | Defining the Y axis of position | Yes* | Relative units (-1.0 to 1.0)  |
| coordinate | Z | Defining the Z axis of position | No* | Relative units (-1.0 to 1.0)  |
| bound | max | Maximum range of position value | No | - |
| bound | min | Minimum range of position value | No | - |
| [screenEdgeLock](#screenedgelock-attribute) | left, right, top, bottom  | Defines a speaker position at a screen edge	| No | - |

If no `bound` attribute is used the the position is the exact value specified.

*If Cartesian coordindates are used then the `X` and `Y` coordinates must be used, but the `Z` coordinate is optional. `Z` has a default of 0.

#### screenEdgeLock attribute

The `screenEdgeLock` attribute allows a speaker to be positioned on the edge of the screen. The attribute can be used in combination with the coordinate=“elevation” and/or the coordinate=“azimuth” attribute and it is set to a string stating at which edge of the screen to the speaker position should be assumed to be (if screen-size information is available), so it is either “left”, “right”, “top”, “bottom”. The coordinate attribute must still be included so it is clear which dimension is being set, and to provide an alternative position should the screen not exist or no screen-size information be available.

The example XML code below illustrates how a speaker positioned on the right edge of the screen can be defined (with an alternative position of −29.0 degrees should the screen not exist).

```xml
<audioBlockFormat ...>
  <speakerLabel>M-SC</speakerLabel>
  <position coordinate="azimuth" screenEdgeLock=”right”>-29.0</position>
  <position coordinate="elevation">0.0</position>
  <position coordinate="distance">1.0</position>
</audioBlockFormat>
```

If two `screenEdgeLock` positions are required (for corners of the screen) then the two `position` elements must be used as shown in the example below. This is because XML does not allow multiple attributes of the same name within the same element.

```xml
  <position coordinate="azimuth" screenEdgeLock=”right”>-29.0</position>
  <position coordinate="elevation" screenEdgeLock=”top”>15.0</position>
```
