# screenRef and audioProgrammeReferenceScreen

The `screenRef` flag is used to indicate whether the corresponding audio signal (e.g. object or HOA signal) is screen-related or not. The screenRef flag can be used by a renderer for special processing of all screen-related objects taking into account the size of a local reproduction screen compared to the production screen-size.

If a renderer uses the `screenRef` flag to enable a special processing, it should use the reference/monitoring/production screen-size of the currently rendered `audioProgramme` as the reference screen.

If the flag is set and no `audioProgrammeReferenceScreen` element is included in the corresponding currently rendered `audioProgramme`, the reference production/monitoring screen is implicitly defined on the basis of Recommendation ITU-R BT.1845 – Guidelines on metrics to be used when tailoring television programmes to broadcasting applications at various image quality levels, display sizes and aspect ratios.

**Default screen size**

|  |  |
|---|---|
| Azimuth of left bottom corner of screen |	29.0° |
| Elevation of the left bottom corner of screen |	−17.3° |
| Aspect ratio | 1.78 (16:9) |
| Polar angular width of the screen	| 58° (as defined by image system 3840 × 2160) |

These spherical values can be transferred to Cartesian coordinates assuming a reference distance of 1.0 by first transferring the values above to the “standard” azimuth/elevation convention (0° azimuth is in front of the right ear, positive values are counted anti-clockwise; 0° elevation is directly above the head, positive values are counted downwards to the front) and then using the trigonometric functions to gain the Cartesian coordinates. The screen is assumed to have its centre touching the unit sphere. This results in the following values:

**Default screen size in Cartesian coordinates**

|  |  |
|---|---|
| X-coordinate of the centre of the screen | 0.0 |
| Y-coordinate of the centre of the screen | 1.0 |
| Z-coordinate of the centre of the screen | 0.0 |
| Aspect ratio | 1.78 |
| Width of the screen | 1.1086 |

NOTE – The maths to convert from the polar coordinate screen to Cartesian coordinates is:

$$
d = \frac{1}{\sqrt{(\tfrac{1}{a^2})\tan^2(\tfrac{w}{2})+1}}
$$

where:
 - d :	Y-coordinate of the centre of the screen
 - a :	aspect ratio
 - w :	polar angle of the screen width.

$$
x = 2d\tan(\tfrac{w}{2})
$$

where:
 - x :	Cartesian screen width
 - w :	polar angle of the screen width.
