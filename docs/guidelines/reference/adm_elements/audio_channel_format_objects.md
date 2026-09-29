# audioChannelFormat - Objects

## Description

An `audioChannelFormat` represents a single sequence of audio samples on which some action may be performed, such as movement of an object, which is rendered in a scene. It is sub-divided in the time domain into one or more [`audioBlockFormat`](#audioblockformat)s.

The [`typeDefinition`](type_definitions.md) described here is for the 'Objects' type, which is used for object-based audio where the position of the audio object may change dynamically. As well as the coordinates of the object, there are parameters for the object’s size, and whether it is a diffuse or coherent sound.

The other types of `audioChannelFormat`s are:

* [DirectSpeakers](audio_channel_format_direct_speakers.md)
* [Matrix](audio_channel_format_matrix.md)
* [HOA](audio_channel_format_hoa.md)
* [Binaural](audio_channel_format_binaural.md)

The `channelLock` parameter will inform a renderer to send the object’s audio to the nearest speaker or channel, rather than the usual panning, interpolation, etc. The `jumpPosition` parameter will ensure the renderer does not perform any temporal interpolation of the position values, so the object will jump in space rather than move smoothly to the next position.

The `position` elements use the `coordinate` attribute to specify which axis is used. The primary coordinate system is the Polar coordinate system, which uses azimuth, elevation and distance axes. However, it is possible to specify other axes for other coordinates such as X, Y and Z for the Cartesian coordinate system. This is described in more detail [here](../excursions/coordinate_system.md).


## Example

```xml
<audioChannelFormat audioChannelFormatID="AC_00031003"
                    audioChannelFormatName="Effect1"
                    typeLabel="0003" typeDefinition="Objects">
  <audioBlockFormat audioBlockFormatID="AB_00031003_00000001" rtime="00:00:00.00000" duration="00:00:02.00000">
    <position coordinate="X">0.8</position>
    <position coordinate="Y">-0.7</position>
    <position coordinate="Z">0.8</position>
    <cartesian>1</cartesian>
    <channelLock maxDistance="0.4">1</channelLock>
    <objectDivergence azimuthRange="20">0.4</objectDivergence>
    <jumpPosition interpolationLength="0.03">1</jumpPosition>
    <importance>3</importance>
    <zoneExclusion>
      <zone minX="-1.0" maxX="-0.7" minY="-1.0" maxY="1.0" minZ="-1.0" maxZ="1.0">LeftSide</zone>
      <zone minX="0.7" maxX="1.0" minY="-1.0" maxY="1.0" minZ="-1.0" maxZ="1.0">RightSide</zone>
    </zoneExclusion>
  </audioBlockFormat>
</audioChannelFormat>
```

## Attributes

The common [`audioChannelFormat` attributes](audio_channel_format.md#common-attributes) are used for the [`typeDefinition`](type_definitions.md) 'Objects'.

## Sub-elements

The common [`audioChannelFormat` sub-elements](audio_channel_format.md#common-sub-elements) are used for the [`typeDefinition`](type_definitions.md) 'Objects'.

## audioBlockFormat

In addition to the common [`audioBlockFormat` attributes](audio_channel_format.md#audioblockformat) the following sub-elements are defined for the `audioBlockFormat` with [`typeDefinition`](type_definitions.md) 'Objects'.

### Sub-elements

Some of the sub-elements depend upon whether polar or Cartesian coordinates are used, while some are common to both systems.

| Sub-element | Description                       | Example | Quantity | Default |
|-------------|-----------------------------------|---------|----------|---------|
| [position](#position)    | Position of sound location for a particular axis | −22.5  | 1...3 | – |
| width       | Horizontal extent                 | 45      | 0 or 1   | 0.0     |
| height      | Vertical extent                   | 20      | 0 or 1   | 0.0     |
| depth       | Distance extent                   | 0.2     | 0 or 1   | 0.0     |
| [objectDivergence](#objectdivergence) | Adjusts the balance between the object’s specified position and two other positions specified by the azimuthRange value (symmetrical on both sides of the object at the object’s position +/– azimuthRange). A value of 0 for the objectDivergence means no divergence. | 0.5 | 0 or 1 | 0.0 | 
| [zoneExclusion](#zoneexclusion) | Indicates which speaker/room zones the object should not be rendered through. |  | 0 or 1 | |
| cartesian   | Specifies coordinate system, if the flag is set to 1 the Cartesian coordinates and otherwise spherical coordinates are used. | 1 | 0 or 1 | 0 |
| diffuse     |  Describes the diffuseness of an audioObject (if it is diffuse or direct sound) | 0.5 | 0 or 1 | 0.0 |
| [channelLock](#channelLock) | If set to 1 a renderer can lock the object to the nearest channel or speaker, rather than normal rendering. If one or more speakers exist in the defined sphere or on its surface, the object snaps to the nearest speaker. | 1 | 0 or 1 | 0 |
| screenRef | Indicates whether the object is screen-related (flag is equal to 1) or not (flag is equal to 0) | 1 | 0 or 1 | 0 |

#### position (for polar coordinates)

| Attribute	| Value	| Description | Required | Units for position sub-element value |
|-----------|-------|-------------|----------|--------------------------------|
| coordinate | azimuth | Defining the azimuth of sound location | Yes | Degrees |
| coordinate | elevation | Defining the elevation of sound location | No | Degrees |
| coordinate | distance | Defining the distance of sound location | No | Normalised to 1 |

#### position (for Cartesian coordinates)

| Attribute	| Value	| Description | Required | Units for position sub-element value |
|-----------|-------|-------------|----------|--------------------------------|
| coordinate | X | Defining the X axis of sound location | Yes | Relative units |
| coordinate | Y | Defining the Y axis of sound location | Yes | Relative units |
| coordinate | Z | Defining the Z axis of sound location | No | Relative units |

#### objectDivergence (for polar coordinates)

| Attribute	| Value	| Description | Required | Units | Default | 
|-----------|-------|-------------|----------|-------|---------|
| azimiuthRange | angle | Azimuth angle of divergence. | No | Degrees (0 to 180.0) | 45.0 |

#### objectDivergence (for Cartesian coordinates)

| Attribute	| Value	| Description | Required | Units | Default | 
|-----------|-------|-------------|----------|-------|---------|
| positionRange | distance | Distance of divergence | No | Relative distance (0 to 1.0) | 0.0 |

#### zoneExclusion (for polar coordinates)

| Sub-element | Description                       | Example | Quantity | Default |
|-------------|-----------------------------------|---------|----------|---------|
| zone        | Specifies the circular projection onto the sphere for spherical coordinates. Multiple zone elements can be used to specify more complex exclusion shapes. | | 1...* | | 

##### zone (for polar coordinates)

| Attribute	| Description | Required | Units | Default | 
|-----------|-------------|----------|-------|---------|
| minAzimuth | Minimum azimuth | Yes | Degrees | |
| maxAzimuth | Maximum azimuth | Yes | Degrees | |
| minElevation | Minimum elevation | Yes | Degrees | |
| maxElevation | Maximum elevation | Yes | Degrees | |

#### zoneExclusion (for Cartesian coordinates)

| Sub-element | Description                       | Example | Quantity | Default |
|-------------|-----------------------------------|---------|----------|---------|
| zone        | Specifies the corner points of a cuboid in the 3D space that will be excluded from rendering for Cartesian coordinates. Multiple zone elements can be used to specify more complex exclusion shapes. | | 1...* | |

##### zone (for Cartesian coordinates)

| Attribute	| Description | Required | Units | Default | 
|-----------|-------------|----------|-------|---------|
| minX | Minimum X | Yes | Relative distance | |
| maxX | Maximum X | Yes | Relative distance | |
| minY | Minimum Y | Yes | Relative distance | |
| maxY | Maximum Y | Yes | Relative distance | |
| minZ | Minimum Z | Yes | Relative distance | |
| maxZ | Maximum Z | Yes | Relative distance | |

#### channelLock

| Attribute	| Description | Required | Units | Default | 
|-----------|-------------|----------|-------|---------|
| maxDistance | Defines the radius of a sphere around the object’s position. If one or more speakers exist in the defined sphere or on its surface, the object snaps to the nearest speaker. If maxDistance is undefined, a default value of infinity is assumed, meaning that the object should snap to the nearest of all speakers (unconditioned channelLock). | No | Relative distance | Infinity |

