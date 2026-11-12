# audioPackFormat

## Description

The `audioPackFormat` groups together one or more `audioChannelFormat`s that belong together. Examples of `audioPackFormat`s are ‘stereo’ and ‘5.1’ for channel-based formats. It can also contain references to other packs to allow nesting. The [`typeDefinition`](type_definitions.md) is used to define the type of channels described within the pack. The `typeDefinition`/`typeLabel` must match those in the referred `audioChannelFormat`s. The sub-elements within `audioPackFormat` are dependent upon the `typeDefinition` or `typeLabel` of the `audioPackFormat` element.

## Common Attributes

| Attribute            | Description                 | Example  | Required | Default |
|----------------------|-----------------------------|----------|----------|---------|
| audioPackFormatID    | ID for the pack. The yyyy digits of AP_yyyyxxxx_represent the type of audio contained in the pack. | AP_00010002 | Yes | - |
| audioPackFormatName  | Name of the pack          | stereo    | Yes      | - |
| typeLabel	| Descriptor of the type of channel | 0001 | No* |
| typeDefinition | Description of the type of channel | DirectSpeakers | No* |
| importance | Importance of a pack. Allows a renderer to discard a pack below a certain level of importance. 10 is the most important, 0 is the least. | 10 | No |

*At least one of typeLabel or typeDefinition is required.

## Common Sub-elements

| Sub-element      | Description                                                       | Example | Quantity |
|------------------|-------------------------------------------------------------------|---------|----------|
| audioChannelFormatIDRef | Reference to an audioChannelFormat | AC_00010001 | 0...* |
| audioPackFormatIDRef | Reference to an audioPackFormat | AP_00010002 | 0...* |
| absoluteDistance | Absolute distance in metres | 4.5 | 0 or 1 |
