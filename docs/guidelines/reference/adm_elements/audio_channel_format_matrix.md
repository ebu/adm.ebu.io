# audioChannelFormat - Matrix

## Description

An `audioChannelFormat` represents a single sequence of audio samples on which
some action may be performed, such as movement of an object, which is rendered
in a scene. It is sub-divided in the time domain into one or more
[`audioBlockFormat`](#audioblockformat)s.

The [`typeDefinition`](type_definitions.md) described here is for the 'Matrix'
type, which means there are extra sub-elements available to allow the definition
of encoding (e.g. Left/Right to Mid/Side), decoding (e.g. Mid/Side to
Left/Right) and direct (e.g. Lo/Ro) matrices.

The other types of `audioChannelFormat`s are:

* [DirectSpeakers](audio_channel_format_direct_speakers.md)
* [Objects](audio_channel_format_objects.md)
* [HOA](audio_channel_format_hoa.md)
* [Binaural](audio_channel_format_binaural.md)

The `matrix` element contains a list of `coefficient` sub-elements which each
refer to other channels and a multiplication factor. All the coefficients in
this list should be added together to generate the matrix equation.

There are three types of matrix that can be defined: encoding, decoding and
direct:

* An encoding matrix will be typically used to describe how the audio signals
  have been encoded to generate matrixed audio signals.
* A decoding matrix will be typically used to describe how the audio signals can
  be converted from matrixed audio signals to another type of output (typically,
  but not restricted to “DirectSpeakers”). This could be the reverse process of
  the encoding matrix. The encoding matrix can reference a decoding matrix to
  connect related matrices.
* A direct matrix can convert from channel-based to channel-based directly
  (such as downmixing).

The [audioPackFormat](audio_pack_format_matrix.md) contains sub-elements that
group Matrix channels and allow cross-referencing between encoding and decoding
matrices.

For example, the encoding matrix element of a ‘Side’ channel will contain two
coefficient sub-elements, one with the value 0.5 referring to "Left" and the
other with a value of −0.5 referring to ‘Right’; this gives

$$\text{Side}=0.5 \cdot \text{Left}-0.5 \cdot \text{Right}.$$

An example of a decoding matrix would be

$$\text{Left} = 0.5\cdot\text{Mid} + 0.5\cdot\text{Side},$$

where ‘Left’ becomes a channel-based output.

A direct matrix example would be a 5.1→LoRo downmix where

$$\begin{align}
\text{Lout} &= \text{Left} + 0.7071 \cdot \text{Centre} + 0.7071 \cdot \text{LeftSurround}\\
\text{Rout} &= \text{Right} + 0.7071 \cdot \text{Centre} + 0.7071 \cdot \text{RightSurround}
\end{align}$$

The values for gain and phase shift can either be constants (using gain and
phase) or they may be variables (using gainVar and phaseVar) that allow the
renderer to decide the value, maybe via another source of metadata.


## Example

```xml
<audioChannelFormat audioChannelFormatID="AC_00021101"
                    audioChannelFormatName="WeirdMidDecode"
                    typeLabel="0002" typeDefinition="Matrix">
  <audioBlockFormat audioBlockFormatID="AB_00021101_00000001">
    <matrix>
      <coefficient gain="0.2" phase="90" delay="0.0">AC_00021001</coefficient>
      <coefficient gainVar="-gv1" phaseVar="-pv1" delayVar="dv3">AC_00021002</coefficient>
    </matrix>
    <outputChannelIDRef>AC_00010001</outputChannelIDRef>
  </audioBlockFormat>
</audioChannelFormat>
```

## Attributes

The common [`audioChannelFormat`
attributes](audio_channel_format.md#common-attributes) are used for the
[`typeDefinition`](type_definitions.md) 'Matrix'.

## Sub-elements

The common [`audioChannelFormat`
sub-elements](audio_channel_format.md#common-sub-elements) are used for the
[`typeDefinition`](type_definitions.md) 'Matrix'.

## audioBlockFormat

In addition to the common [`audioBlockFormat`
attributes](audio_channel_format.md#audioblockformat) the following sub-elements
are defined for the `audioBlockFormat` with
[`typeDefinition`](type_definitions.md) 'Matrix'.

### Sub-elements

| Element | Sub-elements | Description | Quantity |
|---------|--------------|-------------|----------|
| outputChannelFormatIDRef | – | For defining a decoding or direct matrix, this is the output audioChannelFormat that defines the channel being decoded to. |	0 or 1 |
| [matrix](#matrix-sub-elements) | coefficient | Contains the coefficients for combining other channels |	1 |

#### matrix sub-elements

| Sub-element	| Description | Example | Quantity |
|-------------|-------------|---------|----------|
| [coefficient](#coefficient) | Reference to other channel definition. The attributes define the type and value of the coefficient. | AC_00010001 | 1...* |

#### coefficient

| Attribute	| Description |	Units | Example | Required | Default |
|-----------|-------------|-------|---------|----------|---------|
| gain      | Multiplication factor of another channel. Constant value. Type: float	| Linear gain value* | −0.5 | No* | 1.0 |
| gainVar   | Multiplication factor of another channel. Variable. Type: string (reference to float)  | Linear gain value  | clev | No* | - |
| phase     | Phase shift of another channel. Constant value. Type: float | Degrees | 90 | No* | 0.0 |
| phaseVar  | Phase shift of another channel. Variable. Type: string (reference to float) | Degrees | ph | No* | - |
| delay     | Time delay of another channel. Constant value Type: float	ms (float) | 10.5 | 0.0 | No* | 0.0 |
| delayVar  | Time delay of another channel. Variable Type: string (reference to float) | ms (float) | del | No* | - |

*At least one of these attributes must be used. 

**Note 1:** No more than one use of each attribute can be specified.<br />
**Note 2:** A negative gain value implies an inversion of the signal.
