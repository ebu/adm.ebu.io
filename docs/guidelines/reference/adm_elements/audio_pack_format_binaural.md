# audioPackFormat (Binaural)

The `audioPackFormat` with [`typeDefinition`](type_definitions.md) 'Binaural' is used for binaural audio. The `audioPackFormat` definitions with the 'Binaural' type are already defined in the [_Common Definitions_](../../tutorial/common_definitions.md), so they do not need to be defined explicitly when generating ADM metadata.

## Attributes

There are no additional attributes defined for the `audioPackFormat` with [`typeDefinition`](type_definitions.md) 'Binaural'. See [Common Attributes](audio_pack_format.md#common-attributes) for the list of common ones.

## Sub-elements

There are no additional sub-elements defined for the `audioPackFormat` with [`typeDefinition`](type_definitions.md) 'Binaural'. See [Common Sub-elements](audio_pack_format.md#common-sub-elements) for a list of the possible sub-elements. Even though they are defined as a common sub-elements, the `absoluteDistance` and `audioPackFormatIDRef` sub-elements are unlikely to be used in the 'Binaural' mode.

## Example

```xml
<audioPackFormat audioPackFormatID="AP_00050001"
                 audioPackFormatName="Binaural"
                 typeLabel="0005" typeDefinition="Binaural">
  <audioChannelFormatIDRef>AC_00050001</audioChannelFormatIDRef>
  <audioChannelFormatIDRef>AC_00050002</audioChannelFormatIDRef>
</audioPackFormat>
```
