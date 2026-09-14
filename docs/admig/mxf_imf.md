# MXF & IMF Best Practice

## ADM & S-ADM in MXF & IMF

[Standards](../documents/adm_standards.md) and [software](../tech/adm_software.md) exist for supporting ADM & S-ADM metadata (along with audio) in MXF files and IMF Packages. Note that IMF Packages use MXF files to hold their essence and related technical metadata.

## Importance of ADM/S-ADM signaling in MXF Header Metadata

MXF Header Metadata contains essential details about the properties of the video (resolution, video codec parameters, etc) and audio (sampling rate, bit depth, etc) etc inside the MXF file, so that the file can be handled appropriately without access to, and certainly without parsing, the essence. For example, in IMF, the MXF Header Metadata about all the essence in the IMF Package is copied to the IMF CPL XML file so that the IMF Package can be understood without reading the MXF files.

For ADM/S-ADM content to be handled effectively, similar details about the contents of the ADM/S-ADM also need to be stored in the MXF Header Metadata.

## ADM Profile & Level Signaling in MXF

### Overview

It is strongly recommended that for every MXF file containing ADM or S-ADM content:

* The ADM/S-ADM profile(s)/level(s) used are signalled in the MXF Header Metadata

This applies to MXF files in all scenarios: for example, "standalone" files as well as files used as IMF Track Files.

### Technical Background

An MXF file signals the ADM Profile(s)/Level(s) used by ADM/S-ADM metadata by providing a list of "Labels" (in the MXF file these are actually 16-byte SMPTE Universal Labels(ULs)).

Each Label is normally chosen from the entries in the SMPTE Metadata Registers (specifically the Labels Register). These Metadata Registers are available at https://registry.smpte-ra.org/ and published periodically as [SMPTE ST 2123](https://pub.smpte.org/doc/st2123/). Suitable Labels Register entries will have a `Kind` of `LEAF` and should have `Applications` set to `ADMProfileLevel`. Each Label can be referred to by using its `Symbol` or by using its `UL`.

For convenience, [a table of suitable Labels is provided](../adm_profiles_levels_table.html).

Both ADM and S-ADM MXF mappings use the same Labels. However, each MXF mapping stores the list of Labels in a different property:

* For ADM ([SMPTE ST 2131](https://pub.smpte.org/doc/st2131/)) the property is `ADMProfileLevelULBatch` in the `ADMAudioMetadataSubDescriptor`
* For S-ADM ([SMPTE ST 2127-10](https://pub.smpte.org/doc/st2127-10/)) the property is `SADMProfileLevelULBatch` in the `SADMAudioMetadataSubDescriptor`

### Best Practice

**In an MXF file, always include ADM Profile/Level signaling for every set of ADM/S-ADM metadata.**

**If the ADM/S-ADM contains the `profileList` element:**

* In the MXF signaling, use one Label for each `profile` sub-element of the ADM `profileList` element
* Choose the suitable Labels from [this table of Labels](../adm_profiles_levels_table.html)

**Otherwise, if the ADM/S-ADM conforms to a defined Profile and Level but the ADM/S-ADM does not contain the `profileList` element:**

* Choose one or more suitable Labels from [this table of Labels](../adm_profiles_levels_table.html) in line with any guidance provided by the publisher of the ADM/S-ADM Profile

**Finally, if the ADM/S-ADM is just "generic" ADM/S-ADM and is not constrained by any defined Profile or Level:**

* Use [the Label with the Symbol `ADM_ITU2076`](../adm_profiles_levels_table.html)
* This is a "dummy" value signaling that the ADM/S-ADM has not been created in line with any defined Profile or Level
* This Label refers to [ITU-R BS.2076](https://www.itu.int/rec/R-REC-BS.2076/) in general rather than a specific version of it. Therefore, this Label is not for signaling which version of ITU-R BS.2076 is being used by the ADM/S-ADM metadata.
* Use the Label with the Symbol `ADM_ITU2076` in this scenario only. Never use this Label along with another Label.

## Multichannel Audio (MCA) Labeling in MXF

### Overview

Multichannel Audio Labeling (MCA) is an MXF framework for labeling audio content. It is used by all IMF Audio Track Files (MXF files) to identify the nature of their audio content.

MCA is mandatory in all ADM/S-ADM IMF Track Files. It is strongly recommended that all other MXF files containing ADM or S-ADM content also include MCA in their Header Metadata.

### Technical Background

The MCA framework is defined in [SMPTE ST 377-4](https://pub.smpte.org/doc/st377-4/).

It is adapted for ADM content in MXF and IMF by [SMPTE ST 2131](https://pub.smpte.org/doc/st2131/) and [SMPTE ST 2067-204](https://pub.smpte.org/doc/st2067-204/).

It is adapted for S-ADM content in MXF and IMF by [SMPTE ST 2127-1](https://pub.smpte.org/doc/st2127-1/), [SMPTE ST 2127-10](https://pub.smpte.org/doc/st2127-10/) and [SMPTE ST 2067-203](https://pub.smpte.org/doc/st2067-203/).

The approaches to MCA for ADM and for S-ADM are designed to be identical wherever possible, and as similar as possible otherwise.

### Best Practice

**In an MXF file, always include Multichannel Audio Labeling (MCA) for every set of ADM/S-ADM metadata.**

**Always comply with the MCA provisions of IMF ADM/S-ADM "Operational Mode A" unless there are special requirements. In summary, this means:**

* For each `audioProgramme` element in the ADM/S-ADM, include one `ADMSoundfieldGroupLabelSubDescriptor` (ADM) or one `MGASoundfieldGroupLabelSubDescriptor` (S-ADM)

**Populate each `ADMSoundfieldGroupLabelSubDescriptor` (ADM) to describe the associated `audioProgramme`, as follows (where all the listed properties shall be present, unless otherwise stated):**

| Property (Symbol) | Value or Constraint |
|---------------|---------------------|
| `MCALabelDictionaryID` | `urn:smpte:ul:060e2b34.0401010d.03020223.00000000` |
| `MCATagSymbol` | `ADM` |
| `MCATagName` | `ADM` |
| `RFC5646SpokenLanguage` | Equal to the primary spoken language of the `audioProgramme`. Omitted if there is no primary spoken language. Language must be the same as signalled in the ADM metadata (if present), except that language codes will need to be converted (for example, ADM uses "eng" but MCA uses "en"): `RFC5646SpokenLanguage` uses RFC 5646 language tags whereas ADM suggests the use of older ISO 639-1 or -2 codes. |
| `MCAContent` | Use one the "MCA Content" values defined in [SMPTE ST 377-41](https://pub.smpte.org/doc/st377-41/). Example: `PRM` means "primary programme content" |
| `MCAUseClass` | Use one the "MCA Use Class" values defined in [SMPTE ST 377-41](https://pub.smpte.org/doc/st377-41/). Example: `FCMP` means "finished composite". Note that per [SMPTE ST 377-41](https://pub.smpte.org/doc/st377-41/), the valid choices for `MCAUseClass` depend on the value of `MCAContent`. |
| `MCATitle` | Equal to the first `audioProgrammeLabel` sub-element of the `audioProgramme`. If no `audioProgrammeLabel` sub-element is present, then match the `audioProgrammeName` attribute of the `audioProgramme`. |
| `MCATitleVersion` | `n/a` |
| `ADMAudioProgrammeID_ST2131` | Equal to the `audioProgrammeID` attribute of the `audioProgramme` |

* An example MXF file containing MCA conforming to this Best Practice is [published along with SMPTE ST 2067-204](https://pub.smpte.org/doc/st2067-204/20260527-pub/st2067-204-20260527-pub.zip)


**Populate each `MGASoundfieldGroupLabelSubDescriptor` (S-ADM) to describe the associated `audioProgramme`, as follows (where all the listed properties shall be present, unless otherwise stated):**

| Property (Symbol) | Value or Constraint |
|---------------|---------------------|
| `MCALabelDictionaryID` | `urn:smpte:ul:060e2b34.0401010d.03020222.00000000` |
| `MCATagSymbol` | `MGASf` |
| `MCATagName` | `MGA Soundfield` |
| `RFC5646SpokenLanguage` | *[see previous table]* |
| `MCAContent` | *[see previous table]* |
| `MCAUseClass` | *[see previous table]* |
| `MCATitle` | *[see previous table]* |
| `MCATitleVersion` | *[see previous table]* |
| `ADMAudioProgrammeID` | Equal to the `audioProgrammeID` attribute of the `audioProgramme` |

Notes:

* Refer to the latest version of each standard for the authoritative provisions.
* Additional automatically populated properties will also be present in each of these Sub-Descriptors. Additional manually populated properties might also be permitted.
* Although "Operational Mode A" is defined as part of the IMF standards, take this approach even for "standalone" MXF files.
* "Special requirements" could include, for example, the need to label channel-based ADM/S-ADM content using the same Labels as audio in regular IMF Audio Track Files.

