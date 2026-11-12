# objectDivergence

The `objectDivergence` parameter appears in [`audioBlockFormat`](../audio_channel_format_objects.md#audioblockformat) only for the 'Objects' typeDefinition.

The `objectDivergence` parameter (0.0 to 1.0) indicates the amount an object is split symmetrically into a pair of virtual objects, so that a phantom object is created in the position of the original object. The spread of the signal between the virtual objects should not create an image shift from the original object position and should be power preserving across virtual objects and the original. 

The `azimuthRange` and `positionRange` attributes allow the relative positions of virtual objects to be specified. This can either be an angle where spherical coordinates are being used, or a distance value where Cartesian coordinates are being used. When spherical coordinates are used, a value of 45 degrees would place virtual objects 45 degrees to the left and right of the specified object. The default angle is 0 degrees if this attribute is not used. When Cartesian coordinates are used, a value of 0.5 would place the virtual objects at x-0.5,y,z and x+0.5,y,z if x,y,z is the location of the specified object. The default distance is 0.0.

The values of `objectDivergence` should be interpreted as:

| Value	| Description |
|-------|-------------|
| 0     | No divergence with only the original object being present. |
| 1     | Maximum divergence where this would represent virtual objects being created azimuthRange degrees on either side of the original position. |

*Example:* With an LCR loudspeaker configuration and the object positioned directly at the C position, and the LR virtual objects specified by using an `azimuthRange` of 30 degrees. An `objectDivergence` value of 0 indicating no divergence, only the centre speaker would be firing. A value of 0.5 would have all three (LCR) loudspeakers firing equally, and a value of 1 would have the L and R loudspeakers firing equally.
