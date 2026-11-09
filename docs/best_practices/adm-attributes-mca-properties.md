# ADM Attributes and MCA Properties

## Content Kind & ADM Attributes

To describe specific composites ("mixes", e.g. *Complete Main*, *Music & Effects*, *Audio Description Mix* etc.), certain attributes are defined in ADM for <audioContent\> components. In the [*ADM4Legacy* (*Step 1*)](../tech/migration.md) use case, with a strict 1:1 relationship between <audioProgramme\> and <audioContent\>, these are directly referenced.     
Here's an overview of the most commonly applied types (printed in **bold**) as defined in specifications like [EBU R123](https://tech.ebu.ch/docs/r/r123.pdf), [ITU-R BS.2102](https://www.itu.int/rec/R-REC-BS.2102/en) or [ARD-ZDF-ORF TPR 2025](https://www.ard.de/die-ard/b2b/tpr-2025-technische-produktionsrichtlinien-zur-herstellung-von-medienproduktionen-100.pdf)

Reference: [ITU-R BS.2076-3](https://www.itu.int/dms_pubrec/itu-r/rec/bs/R-REC-BS.2076-3-202502-I!!PDF-E.pdf) §5.7.3

|   **TYPE**  | **CODE** (within block `<audioContent>. . .</audioContent>`)|**German Term**|
--------------|----------------------------------------------------|-----------------------|
**COMPLETE MAIN (mixed)**|  `<dialogue mixedContentKind="1“>2</dialogue>`  | **Sendeton** (Standard)|        
**Music & Effects** | `<dialogue nonDialogueContentKind="3“>0</dialogue>`  | **IT/ME** (Musik & Effekte)|      
**AD/VI** (*mixed*)       | `<dialogue mixedContentKind="4“>2</dialogue>`  | **Audiodeskription** (gemischt)|     
**Clear Speech** (*mixed*)  | `<dialogue mixedContentKind="3“>2</dialogue>`  | **Klare Sprache** (gemischt)|    
Music (only)  | `<dialogue nonDialogueContentKind="1“>0</dialogue>` |Musik (solo)|    
Effects (only)| `<dialogue nonDialogueContentKind="2“>0</dialogue>` |Effekte (solo)|    
Mixed "Bed" (unspec. *mixed*)  | `<dialogue mixedContentKind="2">2</dialogue>`| BED ( unspec.)   |
Dialogue (only)|   `<dialogue dialogueContentKind="1“>1</dialogue>` |Sprache/Dialog (solo)|    
Voice over (only)| `<dialogue dialogueContentKind="2“>1</dialogue>` |Übersetzung (solo)|    
Spoken Subtitles (only)| `<dialogue dialogueContentKind="3“>1</dialogue>`|Gesprochene Untertitel (solo)|   
AD (only)|         `<dialogue dialogueContentKind="4“>1</dialogue>` |Audiodeskription (solo)|    
Commentary (only)| `<dialogue dialogueContentKind="5“>1</dialogue>` |Kommentar (solo)|    
Emergency (only)| `<dialogue dialogueContentKind="6“>1</dialogue>` |  Notfallansage|
Undefined |`<dialogue nonDialogueContentKind="0">0</dialogue>`| Unbekannt|

### Set languages in ADM

Languages for `<audioProgrammeLanguage>` and `<audioContentLanguage>` shall be set according to [ISO 639-2](https://www.iso.org/iso-639-language-code) with 3 characters.    
Here some examples:

|  Language | ISO 639-2 Code |
|-----------|----------------|
| ENGLISH | eng |
| FRENCH  | fra/fre|
| GERMAN  | deu |
| ITALIAN | ita |
|(Music & Effects)| zxx|

\>\>Note that *Music&Effects/International Sound* shall be set as *non-linguistic content*: 'zxx'


### How to signal "Original Language Version" in ADM

Usually, versions dubbed in the local language are prioritised in delivery and set as default `<audioProgramme>`.
More and more, "Original Versions" are being offered as alternative.
However, the ADM vocabulary (so far) does not offer an immediate code for distinction between "original" and "dubbed".    
Therefore it is recommended to signal original language versions by naming them in `<audioProgramme`and `<audioContent>`
as well as in `<audioProgrammeLabel>` (incl. different terms assigned via tags options).

### Sample <axml\>

\>\>[This sample](ADM4Legacy-4aP-Sample-axml.md) contains all of the above mentioned features describing a typical *ADM4Lagecy* configuration as defined in [EBU R123](https://tech.ebu.ch/publications/r123) or [ITU-R BS.2102](https://www.itu.int/rec/R-REC-BS.2102/en)

## Content Kind & MCA Properties

If ADM is carried in an MXF OP1-A file using [SMPTE ST 2131](https://pub.smpte.org/doc/st2131/), the use of MXF *Multichannel Audio Labeling (MCA)* is strongly recommended per the [MXF & IMF Best Practice](mxf_imf.md). The MCA properties must reflect the details of the ADM.     

This table provides an overview of how to describe composites ("mixes") with MCA properties (most common types in **bold**)

Reference: [SMPTE-ST 377-41-2023](https://pub.smpte.org/doc/st377-41/20230413-pub/)    

|   **TYPE**  |  MCA meaning | `MCAContent`  | `MCAUseClass`|**German Term**|   
--------------|----------------|--------------|-----------|--------------|    
|**COMPLETE MAIN (mixed)**| Primary| `PRM` |`FCMP` | **Sendeton** (Standard) |         
|**Music & Effects** | Music & Effects | `ME` | `ICMP`  | **IT/ME** (Musik & Effekte) |    
|**AD/VI** (*mixed*)       | Descriptive Video | `DV` | `FCMP` | **Audiodeskription** (gemischt)|    
|**Clear Speech** (*mixed*)  | Hearing Impaired | `HI` | `FCMP` | **Klare Sprache** (gemischt)|  
|Music (only)  |  Music | `MX` | `ICMP` |Musik (solo)|   
|Effects (only)|  Effects/Foley | `FX`/`FOL` | `ICMP` |Effekte/Geräusche (solo)|
|<span style="color: grey;">[Mixed "Bed" (unspec. *mixed]</span>| n/a | n/a | n/a |BED ( unspec.)   |  
|Dialogue (only)|  Dialogue | `DX` | `ICMP` | Sprache/Dialog (solo)|    
|Voice over (only)|  Voice-Over | `VO` | `SING` |Übersetzung (solo)|   
|<span style="color: grey;">[Spoken Subtitles (only)]</span>|  n/a | n/a | n/a | Gesprochene Untertitel (solo)|
|AD (only)| Visually Impaired | `VI` | `SING` |Audiodeskription (solo)|   
|Commentary (only)| Recorded Commentary | `CM` | `SING` |Kommentar (solo)|    
|<span style="color: grey;">[Emergency]</span> |  n/a | n/a | n/a | Notfallansage|   
|<span style="color: grey;">[Undefined]</span> |  n/a | n/a | n/a |Unbekannt|    
|(Silence) | Silence | `MOS` | `SMPL` | (Stille) |    

Note: Lines containing entries formatted '<span style="color: grey;">[...]</span>' and contain 'n/a' have no correspondence in MCA properties and therefore are not to be applied. They're listed here only to match with the entries in table 1.


Note: Note: `MCAContent` values do not consider "objects", only composites and elements.  
To distinguish these, `MCAUseClass` values are defined:  

| Meaning | `MCAUseClass` | Definition |
---------------------|--------|------------|
|Finished Composite   | `FCMP`   |The associated MCA Content is a composite, complete work and need not be mixed prior to presentation. It can be mixed with other Soundfield Groups to create other particular desired content per the allowed combinations in Table 4.|
|Intermediary Composite| `ICMP`  |The associated MCA Content is a composite but requires mixing with other elements prior to presentation. It can be mixed with other Soundfield Groups to create desired FCMP content per the allowed combinations in Table 4.|
|Simplified           | `SMPL`  | The associated MCA Content contains a simplified mix, typically mono, stereo or Lt-Rt, intended for special uses. It can be mixed with other SMPL Soundfield Groups to create desired SMPL content per the allowed combinations in Table 4.|
|Singular             | `SING`  | Element contains a single content (such as narration voice) that can be output on its own or be mixed with other Soundfield Groups.|

Therefore, the `MCAContent` values have limited correspondences with the object-based concept of ADM.

### Set languages in MCA

Note: MCA labels require RFC5646 [IETF language tags](https://datatracker.ietf.org/doc/html/rfc5646)
Some examples

|  Language | RFC5646 Code |
|-----------|----------------|
| ENGLISH GB | en-GB |
| ENGLISH US | en-US |
| FRENCH  | fr-FR|
| GERMAN  | de-DE |
| ITALIAN | it-IT |


### How to signal "Original Language Version" in MCA

MCA offers a simple way to distinguish between "original" and "dubbed" language: `MCASpokenLanguageAttribute`

|`MCASpokenLaguageAttribute`|Definition|
|--------|-----------|
|`ORIGINAL`|Indicates that the MCA Content contains the original spoken dialog|
| `DUBBED` |Indicates that the MCA Content contains dubbed dialog which replaces some or all of the original spoken dialog with another language|



### Sample MCA
The test vector 1.1.6 in the [1st ADM Plugfest](../admig/plugfest1.md) (June 2026) was modelled similar to a typical "ADM4Legacy" use case containing different channel-based mixes:    

* Complete Main (Sendeton) 2.0
* Music & Effects (IT(ME) 2.0
* Audio Description Mix (AD) 2.0
* Original Version (OV) 2.0
* Complete Main (Sendeton) 5.1  

The mca-label.txt file created for the conversion/muxing of the BW64-ADM.wav in [bmx tool for MXF](https://github.com/ebu/bmx) contained

```
0
# audioProgramme_1
ADM, chunk_id=axml, RFC5646SpokenLanguage="de-DE", MCATitle="MAIN_MIX_2.0-SENDETON_GER", MCATitleVersion="n/a", MCAContent="PRM", MCAUseClass="FCMP", ADMAudioProgrammeID="APR_1001"
# audioProgramme_2
ADM, chunk_id=axml, MCATitle="IT/ME 2.0", MCATitleVersion="n/a", MCAContent="ME", MCAUseClass="ICMP", ADMAudioProgrammeID="APR_1002"
# audioProgramme_3
ADM, chunk_id=axml, RFC5646SpokenLanguage="de-DE", MCATitle="AD-MIX_2.0", MCATitleVersion="n/a", MCAContent="DV", MCAUseClass="FCMP", ADMAudioProgrammeID="APR_1003"
# audioProgramme_4
ADM, chunk_id=axml, RFC5646SpokenLanguage="en-GB", MCATitle="n/a", MCATitleVersion="n/a", MCAContent="PRM", MCAUseClass="FCMP", MCASpokenLanguageAttribute="ORIGINAL", ADMAudioProgrammeID="APR_1004"
# audioProgramme_5
ADM, chunk_id=axml, RFC5646SpokenLanguage="de-DE", MCATitle="MAIN_MIX_5.1-SENDETON_GER", MCATitleVersion="n/a", MCAContent="PRM", MCAUseClass="FCMP", ADMAudioProgrammeID="APR_1005"
```



The final command line to mux the ADM.wav into a *MXF ST2131* with *bmx* followed this pattern:

```
raw2bmx -t op1a -o OUTPUT-ADM.mxf --audio-layout adm --track-mca-labels x mca-ADM-label-PF26-TV_1_1_6.txt --adm-wave-chunk axml,urn:smpte:ul:060e2b34.0401010d.04020211.02020000 --wave INPUT-ADM.wav
```


\>\>Note: The `urn:smpte:ul:060e2b34.0401010d.04020211.02020000` refers to the SMPTE Label for *ADM_ITU2168_Emission_V1_L1* as defined in [ITU-R BS.2168-0](https://www.itu.int/dms_pubrec/itu-r/rec/bs/R-REC-BS.2168-0-202502-I!!PDF-E.pdf)       
    See [this table of Labels](./adm_profiles_levels_table.html) for reference on the defined ADM Profiles and Levels.    
