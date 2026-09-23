# audioObject

## Description

An `audioObject` element establishes the relationship between the content, the format via audio packs, and the assets using the [`audioTrackUID`](audio_track_uid.md) elements. `audioObject`s can be nested to group together other `audioObjects`.

## Example

```xml
<audioObject audioObjectID="AO_1002"
             audioObjectName="Object2"
             start="00:00:00.00000"
             dialogue="0" importance="5" interact="1" disableDucking="0">
  <audioPackFormatIDRef>AP_00010001</audioPackFormatIDRef>
  <audioComplementaryObjectIDRef>AO_1001</audioComplementaryObjectIDRef>
  <audioTrackUIDRef>ATU_00000003</audioTrackUIDRef>
  <audioObjectInteraction onOffInteract="1" gainInteract="1">
    <gainInteractionRange bound="min">0.2</gainInteractionRange>
    <gainInteractionRange bound="max">2.0</gainInteractionRange>
  </audioObjectInteraction>
  <gain>1.0</gain>
  <alternativeValueSet alternativeValueSetID=”AVS_1001_0001”>
    <gain>1.5</gain>
  </alternativeValueSet>
  <alternativeValueSet alternativeValueSetID=”AVS_1001_0002”>
    <gain>0.5</gain>
  </alternativeValueSet>
</audioObject>
```

## Attributes

| Attribute            | Description                 | Example  | Required | Default |
|----------------------|-----------------------------|----------|----------|---------|
| audioObjectID        | ID of the object            | AO_1001  | Yes      |         |
| audioObjectName      | Name of the object          | dialogue_stereo    | Yes      | |
| start                | Start time for the object, relative to the start of the programme.      | 00:00:00.00000 or 00:00:00.000000S480000 | No | 00:00:00.00000 |
| duration             | Duration of object.         | 00:02:00.00000 or 00:02:00.000000S480000 | No | unbounded |
| importance           | Importance of an object. Allows a renderer to discard an object below a certain level of importance. 10 is most important, 0 least. | 10 | No | 10 |
| interact             | Set to 1 if a user can interact with the object, 0 if not. | 1 | No | 0 |
| disableDucking       | Set to 1 to disallow automatic ducking of object, 0 to allow ducking |	0	| No | 0 |

The time is shown in the format of ‘hh:mm:ss.zzzzz’. ‘hh:mm:ss.zzzzz’ indicates hours, minutes, seconds and fractional seconds.

## Sub-elements

| Sub-element      | Description                                                       | Example | Quantity |
|------------------|-------------------------------------------------------------------|---------|----------|
| audioPackFormatIDRef | Reference to an audioPackFormat for format description	| AP_00010001	| 0...* |
| audioObjectIDRef | Reference to another audioObject | AO_1002 | 0..* |
| [audioObjectLabel](#audioobjectlabel) | The object description in the language specified by the language attribute. | "Dialogue" | 0...* |
| [audioComplementaryObjectGroupLabel](#audiocomplementaryobjectgrouplabel) | The complementary object description in the language specified by the language attribute. | "English" | 0...* |
| [audioComplementaryObjectIDRef](#audiocomplementaryobjectidref)	| Reference to another audioObject that is complementary to the object, e.g. to describe mutually exclusive languages. | AO_1003 | 0..* |
| audioTrackUIDRef | Reference to an audioTrackUID (when using a BW64 file, this is listed in the <chna> chunk)	| ATU_00000001 | 0..* |
| [audioObjectInteraction](#audioobjectinteraction) | Specification of possible user interaction with the object. | | 0 or 1 |
| [gain](#gain) | Definition of a gain value to be applied to all audio samples referenced by the audioObject. The default value is 1.0. An optional gainUnit attribute (either ‘linear’ or ‘dB’) can be used to define the unit of the gain value. The default unit is ‘linear’. | 0.5 | 0 or 1 |
| headLocked | Indicates if the perceived location of the audio element is locked to the head (flag = 1) or not locked (flag = 0) | 1 | 0 or 1 |
| [positionOffset](#positionoffset) | Apply an offset to the position of all the elements in the audioObjects. One for each axis. | 30.0 | 0...3 |
| mute | Status of the audioObject to play back or not. Set to 0 if the object is played back (default). Set to 1 if the object is muted. | 1 | 0 or 1 |
| [alternativeValueSet](#alternativevalueset) | An alternative set of parameters that will be used if the alternativeValueSetID is referenced by an audioProgramme or audioContent element. | | 0...* |

If the value of `audioTrackUIDRef` is set to ATU_00000000 it does not refer to a track in the file, but refers to a virtual empty track. This can be useful for multichannel formats where some of the channels are not being used, so instead of storing zero value samples in the file, this silent track is used instead thus saving space in the file.

### audioObjectLabel

The `audioObjectLabel` is used to define a human-readable object label that may be displayed in an end-user device. Multiple labels can be defined for different language versions of the name in the label.   

| Attribute | Description | Type | Required |
| --------- | ----------- | ---- | -------- |
| language  | Used for definition of multiple audioProgramme labels in different languages. The language code should be given as a 2- or 3-character code as specified by ISO 639-1 or ISO 639-2. Both ISO 639-2/B and ISO 639-2/T may be used. | string | No (unless multiple labels are used) |

### audioComplementaryObjectGroupLabel

The `audioComplementaryObjectGroupLabel` element contains a textual label for a set of mutually exclusive audioObjects, e.g. language tracks that contain the same dialogue in different dub versions.

The `audioComplementaryObjectGroupLabel` element, when present, shall only be included in one corresponding parent audioObject for each set of mutually exclusive contents. It shall be included in the same parent `audioObject` that also contains the `audioComplementaryObjectIDRef` sub-elements.

| Attribute | Description | Type | Required |
| --------- | ----------- | ---- | -------- |
| language  | Used for definition of multiple audioProgramme labels in different languages. The language code should be given as a 2- or 3-character code as specified by ISO 639-1 or ISO 639-2. Both ISO 639-2/B and ISO 639-2/T may be used. | string | No (unless multiple labels are used) |

### audioComplementaryObjectIDRef

The `audioComplementaryObjectIDRef` element contains a reference to another `audioObject` that is complementary to the parent `audioObject`. A list of `audioComplementaryObjectIDRef`s can therefore be used to describe mutually exclusive objects, e.g. language tracks that contain the same dialogue in different dub versions (“XOR” relationship).

To avoid cross-references between `audioComplementaryObjectIDRef`s of several `audioObject`s, the `audioComplementaryObjectIDRef` sub-element should only be included in one corresponding parent `audioObject` for each set of mutually exclusive contents. The parent `audioObject` with the `audioComplementaryObjectIDRef`s should be the one that contains the default version of the set of mutually exclusive objects.

### audioObjectInteraction sub-element

An `audioObjectInteraction` element describes any possible user interaction with the corresponding parent `audioObject`. It should be present only if the `interact` attribute of the parent `audioObject` is set to 1. In case the “Interact” attribute of the parent `audioObject` is set to 0, any `audioObjectInteraction` element should be ignored. The `audioObjectInteraction` element has the following attributes and sub-elements.

| Attribute |	Description |	Example	| Required |
| ----------|-------------|---------|----------|
| onOffInteract	| Set to 1 if a user can switch the object on or off, 0 if not.	| 1	| Yes |
| gainInteract | Set to 1 if a user can change the gain of the object, 0 if not. | 1 | Optional |
| positionInteract | Set to 1 if a user can change the position of the object, 0 if not. | 0 | Optional |

If the `onOffInteract` attribute is set to 1, the `audioObject` can be swithced on or off by the user. If the `gainInteract` attribute is set to 1, the gain of the `audioObject` can be changed by the user according to the [`gainInteractionRange`](#gaininteractionrange) sub-element. If the `positionInteract` attribute is set to 1, the positions of the `audioBlockFormat`s in the parent `audioObject` can be changed by the user according to the [`positionInteractionRange`](#positioninteractionrange) sub-element.

If an `audioObject` allows interaction, the change to an attribute that can be set by the user should be within the limits of the interaction range of that `audioObject`. In this context, a “change” is the difference between a condition before and after the interaction.
The resultant position and gain of a sound source is the combination of the attributes of the position and gain sub-elements of the `audioBlockFormat` and all the changes caused by interaction in the hierarchy of `audioObject`s that refer to the `audioBlockFormat`.

Previous versions of the Recommendation, up to and including Recommendation BS.2076-2, did not
explicitly prohibit the presence of an `audioObjectInteraction` element when the `interact` attribute of
the `audioObject` element is not set to 1. When it is known that the metadata adheres to versions up to
and including Recommendation BS.2076-2, any `audioObjectInteraction` sub-element shall be ignored
when the `interact` attribute of the parent `audioObject` element is not present or not set to 1.

#### gainInteractionRange

| Bound attribute	| Description	| Units |	Example |
|-----------------|-------------|-------|---------|
| min	            | Minimum gain factor of possible user gain interaction (gainMin = gain (or 1.0 if not defined) * gainInteractionRangeMin) | linear gain value | 0.5 |
| max	            | Maximum gain factor of possible user gain interaction (gainMax = gain (or 1.0 if not defined) * gainInteractionRangeMax) | linear gain value | 1.5 |

##### Example

```xml
<audioObjectInteraction onOffInteract="1" gainInteract="1">
  <gainInteractionRange bound="min">-20.0</gainInteractionRange>
  <gainInteractionRange bound="max">3.0</gainInteractionRange>
</audioObjectInteraction>
```

#### positionInteractionRange

For polar coordinates:

| coordinate attribute | bound attribute | Description | Units | Example |
|----------------------|-----------------|-------------|-------|---------|
| azimuth | min	| Minimum azimuth offset value of possible user position interaction | Degrees | –30.0 |
| azimuth | max | Maximum azimuth offset value of possible user position interaction | Degrees | +30.0 |
| elevation | min | Minimum elevation offset value of possible user position interaction | Degrees | –15.0 |
| elevation | max | Maximum elevation offset value of possible user position interaction | Degrees | +15.0 |
| distance | min | Minimum normalised distance of possible user position interaction | 0 to 1 | 0.5 |
| distance | max | Maximum normalised distance of possible user position interaction | 0 to 1 | 0.5 |

##### Example

```xml
<audioObjectInteraction onOffInteract="1" positionInteract="1">
  <positionInteractionRange bound="min" coordinate="azimuth">-50.0</positionInteractionRange>
  <positionInteractionRange bound="max" coordinate="azimuth">50.0</positionInteractionRange>
  <positionInteractionRange bound="min" coordinate="elevation">-20.0</positionInteractionRange>
  <positionInteractionRange bound="max" coordinate="elevation">20.0</positionInteractionRange>
  <positionInteractionRange bound="min" coordinate="distance">0.6</positionInteractionRange>
  <positionInteractionRange bound="max" coordinate="distance">1.0</positionInteractionRange>
</audioObjectInteraction>
```

For Cartesian coordinates:

| coordinate attribute | bound attribute | Description | Units | Example |
|----------------------|-----------------|-------------|-------|---------|
| X | min | Minimum X-axis offset value of possible user position interaction | Normalized Units | –0.5 |
| X | max | Maximum X-axis offset value of possible user position interaction | Normalized Units | +0.5 |
| Y | min | Minimum Y-axis offset value of possible user position interaction | Normalized Units | –0.2 |
| Y | max | Maximum Y-axis offset value of possible user position interaction | Normalized Units | 0.0 |
| Z | min | Minimum Z-axis offset value of possible user position interaction | Normalized Units | 0.1 |
| Z | max | Maximum Z-axis offset value of possible user position interaction | Normalized Units | 0.4 |

##### Example

```xml
<audioObjectInteraction onOffInteract="1" positionInteract="1">
  <positionInteractionRange bound="min" coordinate="X">-0.5</positionInteractionRange>
  <positionInteractionRange bound="max" coordinate="X">0.5</positionInteractionRange>
  <positionInteractionRange bound="min" coordinate="Y">-0.2</positionInteractionRange>
  <positionInteractionRange bound="max" coordinate="Y">0.2</positionInteractionRange>
  <positionInteractionRange bound="min" coordinate="Z">0.0</positionInteractionRange>
  <positionInteractionRange bound="max" coordinate="Z">1.0</positionInteractionRange>
</audioObjectInteraction>
```

### gain

| Attribute | Description | Type | Required |
| --------- | ----------- | ---- | -------- |
| gainUnit  | This attribute (either ‘linear’ or ‘dB’) can be used to define the unit of the gain value. The default unit is ‘linear’. | string | No | 

### positionOffset

For when polar coordinates are used:

| Attribute | Value | Description | Required |
| --------- | ----- | ----------- | -------- |
| coordinate | azimuth | Apply an offset to the "azimuth" angle. | Yes* | 
| coordinate | elevation | Apply an offset to the "elevation" angle. | Yes* | 
| coordinate | distance | Apply an offset to the "distance". | Yes* | 

For when Cartesian coordinates are used:

| Attribute | Value | Description | Required |
| --------- | ----- | ----------- | -------- |
| coordinate | X | Apply an offset to the "X" axis. | Yes* | 
| coordinate | Y | Apply an offset to the "Y" axis. | Yes* | 
| coordinate | Z | Apply an offset to the "Z" axis. | Yes* | 

*A coordinate attribute must be applied, but the any of the values can be used. 

### alternativeValueSet

The `alternativeValueSet` sub-element allows an alternative set of parameters for the `audioObject` to be defined. The parameters defined in this sub-element shall take precedence over the same parameters in the parent `audioObject` element. The parameters defined in the parent `audioObject` that have not been defined in the `alternativeValueSet` shall be used in that `alternativeValueSet`. Multiple `alternativeValueSet`s can be defined in an audioObject to allow multiple variations to be defined.

This table lists the sub-elements that are contained within `alternativeValueSet`, and each has the
same specification of the same sub-elements in the parent `audioObject`.

| Sub-element | 
| ----------- |
| audioObjectLabel |
| audioObjectInteraction |
| gain |
| headLocked |
| positionOffset |
| mute |

The restrictions on the presence of the `audioObjectInteraction` sub-element in the `alternativeValueSet`
element depend on the `interact` attribute of the parent `audioObject` element. If the `interact` attribute of
the parent `audioObject` element is not present or is set to 0, the `audioObjectInteraction` sub-element
in the `alternativeValueSet` element shall not be present. If the `interact` attribute of the parent
`audioObject` element is present and set to 1, there is no requirement on whether the
`audioObjectInteraction` sub-element in the `alternativeValueSet` element shall be present or not. If the
`interact` attribute of the parent `audioObject` element is set to 1 and the `audioObjectInteraction` sub-
element in the `alternativeValueSet` element is not present, the `audioObjectInteraction` sub-element in
the parent `audioObject` element shall be used. In this case, if the `audioObjectInteraction` sub-element
in the parent `audioObject` element is also not present, this shall indicate that on-off interaction,
unlimited gain interaction and unlimited position interaction are enabled for the `audioObject` element
when the `alternativeValueSet` element is active.

| Attribute | Description | Example | Required |
| --------- | ----------- | ----------- | -------- |
| alternativeValueSetID | ID for the alternativeValuesSet | AVS_1001_0001 | Yes | 

The `alternativeValueSetID` shall be in this format: `AVS_wwww_zzzz`, where ‘w’ and ‘z’ are hexadecimal digits. The ‘wwww’ shall match the ‘wwww’ of the parent `audioObjectID`, and the ‘zzzz’ shall be a unique value for each
alternativeValueSet sub-element used within the parent `audioObject`.

The `alternativeValueSetID` may be referenced from either `audioProgramme` or `audioContent`.

## Nested audioObjects and timing parameters

When audioObject elements are nested the start time of the `audioObject` is still relative to the start of the programme, not the relative to the `audioObject` that refers to it. It is required to ensure that any `audioObject` that is referred from another audioObject does not have a start time earlier than the referent, nor does it have an end time (i.e. start + duration) after the referent.
