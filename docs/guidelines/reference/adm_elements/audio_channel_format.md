# audioChannelFormat

## Description

An `audioChannelFormat` represents a single sequence of audio samples on which some action may be performed, such as movement of an object, which is rendered in a scene. It contains one or more [`audioBlockFormat`](#audioblockformat)s, which sub-divide it in the time domain. The [`typeDefinition/typeLabel`](type_definitions.md) is used to define the type of channel.

The types of `audioChannelFormat`s are:

* [DirectSpeakers](audio_channel_format_direct_speakers.md)
* [Matrix](audio_channel_format_matrix.md)
* [Objects](audio_channel_format_objects.md)
* [HOA](audio_channel_format_hoa.md)
* [Binaural](audio_channel_format_binaural.md)

## Common Attributes

| Attribute            | Description                 | Example  | Required |
|----------------------|-----------------------------|----------|----------|
| audioChannelFormatName | Name of the channel | FrontLeft | Yes |
| audioChannelFormatID | ID of the channel. The yyyy digits of AC_yyyyxxxx_represent the type of audio contained in the channel. The xxxx digits should match the audioStreamFormat xxxx digits. | AC_00010001 | Yes |
| typeLabel | Descriptor of the type of channel | 0001 | Optional |
| typeDefinition | Description of the type of channel | DirectSpeakers | Optional |


\*	At least one of `typeLabel` or `typeDefinition` is required.

The typeDefinition of the `audioChannelFormat` specifies the type of audio it is describing, and also determines which parameters are used within its `audioBlockFormat` children.

## Common Sub-elements

| Sub-element      | Description                                                | Attributes | Quantity |
|------------------|------------------------------------------------------------|------------|----------|
| audioBlockFormat | Time division of channel containing dynamic metadata  | |	1...* |
| frequency | Sets a high or low cut-off frequency for the audio in Hz | typeDefinition = “lowPass" or “highPass" |	0...2 |

## audioBlockFormat

An `audioBlockFormat` represents a single sequence of `audioChannelFormat` samples with fixed parameters, including position, within a specified time interval.

### Attributes

| Attribute	| Description |	Example	| Required | Default |
|-----------|-------------|---------|----------|---------|
| audioBlockFormatID | ID for block	| AB_00010001_00000001 | Yes |
| rtime	| Start [time](#time-format) of block (relative to the start time of the parent audioObject) | 00:00:00.00000 or 00:00:00.00000S48000 | No | 00:00:00.00000 |
| duration | Duration [time](#time-format) of block. | 00:00:10.00000 or 00:00:10.00000S48000| No | unbounded duration |

The last 8 hexadecimal digits in the `audioBlockFormatID` contain the index for the block within the channel, starting at 00000001 for the first block.
If `rtime` is not used then the block starts at 00:00:00.00000. If `duration` is not used then the block lasts for the whole duration of the channel.
If there is only one `audioBlockFormat` within an `audioChannelFormat` it is assumed to be a ‘static’ object that lasts the duration of the channel, therefore `rtime` and `duration` should be omitted. When there is more than one `audioBlockFormat` within an `audioChannelFormat` it is assumed to be a ‘dynamic’ object, therefore both `rtime` and `duration` should be used.

#### Time Format

Two time formats are available for use: 
 * Decimal format: ‘hh:mm:ss.zzzzz’ which indicate hours, minutes, seconds and fractional seconds.
 * Fractional format: 'hh:mm:ss.zzzzzSfffff' where the 'z' digits represent the numerator of a fraction and the 'f' digits represent the denominator. The number of 'z' digits must match the number of 'f' digits. For example 01:34:16.12000S48000 is the same as 01:34:16.25000.

### Common Sub-elements

The sub-elements within `audioBlockFormat` depend upon the [`typeDefinition/typeLabel`](type_definitions.md) of the `audioChannelFormat`, but the following sub-elements are common to all types:

| Sub-element      | Description       | Example | Quantity | Default |
|------------------|-------------------|---------|----------|---------|
| [gain](#gain) | Gain value  | 0.5 | 1...* | 0 or 1 | 1.0 |
| [importance](parameters/importance.md) | Importance of the audioChannelFormat for the duration of the block. An integer in the range 0 to 10 | 4 | 0 or 1 | 10 |
| [jumpPosition](#jumpposition) | Determines whether the time-variant parameters are interpolated over the duration of the block (set to 0), or change over a shorter period (including immediately) (set to 1). | 1 | 0 or 1 | 0 |  
| headLocked | Indicates if the perceived location of the audio element is locked to the head (flag = 1) or not locked (flag = 0) | 1 | 0 or 1 | 0 |
| [headphoneVirtualise](#headphonevirtualise) | Headphone virtualiser parameters. | 1 | 0 or 1 | 0 |

#### gain

More details about the `gain` parameter [here](parameters/gain.md)

| Attribute	| Description |	Example	| Required | Default |
|-----------|-------------|---------|----------|---------|
| gainUnit | Defines the unit of gain, either 'linear' or 'dB'.	| 'dB' | No | 'linear' |

#### jumpPosition

More details about the `jumpPosition` parameter [here](parameters/jump_position.md)

| Attribute	| Description |	Example	| Required | Default |
|-----------|-------------|---------|----------|---------|
| interpolationLength | Defines the duration of the interpolation of the time-variant parameters in the block. If not used then the time-varient parameters change immediately.	| 0.05 or 240S48000 | No | 0 |

#### headphoneVirtualise

| Attribute	| Description |	Example	| Required | Default |
|-----------|-------------|---------|----------|---------|
| bypass | Specifies whether the object should be virtualised using a headphone virtualiser or not (1=renderer to stereo, 0=renderer with headphone virtualiser)	| 1 | No | 0 |
| DRR | Direct to Reverberant Ratio in dB. | 100 | No | 130 _(anechoic)_ |
