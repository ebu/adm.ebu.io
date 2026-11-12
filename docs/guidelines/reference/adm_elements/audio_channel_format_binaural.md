# audioChannelFormat - Binaural

## Description

An `audioChannelFormat` represents a single sequence of audio samples on which some action may be performed, such as movement of an object, which is rendered in a scene. It is sub-divided in the time domain into one or more [`audioBlockFormat`](#audioblockformat)s.

This is for binaural representation of audio. Given that binaural consists of two channels, the left and right ear, this is rather simple. As the name of the audioChannelFormat will be either “LeftEar” or “RightEar” there is no other metadata required in audioBlockFormat.

The [`typeDefinition`](type_definitions.md) described here is for the 'Binaural' type, which is used for binaural audio. The `audioChannelFormat` definitions with the 'Binaural' type are already defined in the [_Common Definitions_](../../tutorial/common_definitions.md), so they do not need to be defined explicitly when generating ADM metadata.

The other types of `audioChannelFormat`s are:

* [DirectSpeakers](audio_channel_format_direct_speakers.md)
* [Matrix](audio_channel_format_matrix.md)
* [Objects](audio_channel_format_objects.md)
* [HOA](audio_channel_format_hoa.md)

## Example

```xml
<audioChannelFormat audioChannelFormatID="AC_00050001"
                    audioChannelFormatName="LeftEar"
                    typeLabel="0005" typeDefinition="Binaural">
  <audioBlockFormat audioBlockFormatID="AB_00050001_00000001"/>
</audioChannelFormat>
```

## Attributes

The common [`audioChannelFormat` attributes](audio_channel_format.md#common-attributes) are used for the [`typeDefinition`](type_definitions.md) 'Binaural'.

## Sub-elements

The common [`audioChannelFormat` sub-elements](audio_channel_format.md#common-sub-elements) are used for the [`typeDefinition`](type_definitions.md) 'Binaural'.

## audioBlockFormat

The `audioBlockFormat` with [`typeDefinition`](type_definitions.md) 'Binaural' uses the common [`audioBlockFormat` attributes](audio_channel_format.md#audioblockformat).
