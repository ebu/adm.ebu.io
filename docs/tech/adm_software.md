# ADM Related Software


## EBU provided resouces

### ADM Code Libraries

* [libadm](https://github.com/ebu/libadm) - The libadm library is a modern C++11 library to parse, modify, create and write ITU-R BS.2076 conformant XML.
   It works well with the header-only ..
* [libbw64](https://github.com/ebu/libbw64) - C++ library to write ADM related BW64 files and applications with minimal dependencies
* [libear](https://github.com/ebu/libear) - C++ library for the EAR (EBU ADM Renderer) to render ADM according to [EAR - EBU ADM Renderer] (https://www.itu.int/rec/R-REC-BS.2127)


### ADM Renderer & Applications

* [**EAR - EBU ADM Renderer**](https://github.com/ebu/ebu_adm_renderer)    
   → the reference implementation of [EBU TECH 3388 ADM Renderer](https://tech.ebu.ch/publications/tech3388)    
   → renders ADM to channel-based layouts defined in [ITU-R BS.2051](https://www.itu.int/rec/R-REC-BS.2051/en)         
   → contains also `ear-utils`, some simple Command Line tools to extract and manipulate ADM data from BWF


* [**BEAR - Binaural EBU ADM Renderer**](https://github.com/ebu/bear)    
   → an *EAR*-based binaural renderer for ADM as specified in [EBU TECH 3396](https://tech.ebu.ch/publications/tech3396)    
   → integrated as VST3 in:

* [**EAR PRODUCTION SUITE REPO**](https://github.com/ebu/ear-production-suite)    
  The main repo for development and building the *EAR Production Suite* from source

* [**EAR PRODUCTION SUITE BUILDS**](https://ear-production-suite.ebu.io)    
   → a suite of VST3 plug-ins for use in REAPER DAW as a proof of concept and reference implementation.
   At present, only BS.2076-2 compliant files are generated.

* [**EAT - EBU ADM TOOLBOX**](https://github.com/ebu/ebu-adm-toolbox)    
   → A set of tools for processing ADM files. It can convert ADM files between profiles, validate them, render them, fix common issues, and more.


* [**ADM Common Definition XML Generator**](https://github.com/bbc/adm_common_def_gen)    
   → Python script for generating the [ADM Common Definitions](https://www.itu.int/rec/R-REC-BS.2094/en) XML file.
     This repo contains also a specific .xsd: https://github.com/bbc/adm_common_def_gen/blob/main/data/adm_v3_itu.xsd

## Wrapping ADM in MXF

* [**BMX tool for MXF**](https://github.com/ebu/bmx)    
  → Formerly developed by [BBC R&D](https://github.com/bbc/bmx)
  →Open Source - the 'Swiss Army Knife' for MXF in broadcast workflows
  → allows to wrap ADM [SMPTE ST2067-204](https://pub.smpte.org/doc/st2067-204/) for IMF [SMPT ST2067-70](https://pub.smpte.org/doc/st2067-70/) and [SMPTE ST2131](https://pub.smpte.org/doc/st2131/)

* [**Dolby Repo muxer**](https://github.com/DolbyLaboratories/repo-muxer)    
   → is a fork from an earlier version of  https://github.com/bbc/bmx that implemented muxing S-ADM (Dolby Repository File)    
   → A merge into the main EBU-bmx repo is projected.

* [**IMF Tool**](https://github.com/IMFTool/IMFTool)    
   → Open Source reference tool for applying MGA S-ADM [SMPTE ST2067-203](https://pub.smpte.org/doc/st2067-203/) and ADM Audio [SMPTE ST2067-204](https://pub.smpte.org/doc/st2067-204/) in IMF [SMPT ST2067-70](https://pub.smpte.org/doc/st2067-70/)




## Vendor provided resources

### DOLBY

* [**Dolby PMD Tool**](https://github.com/DolbyLaboratories/pmd_tool)     
   →'pmd_tool' is a command line utility that converts between the following representations of professional audio metadata:   
       - ADM/Serial ADM Metadata as defined in ITU Rec. BS. 2076/2125      
       - SMPTE ST 2116 PMD as defined in SMPTE RDD49 metadata    

* [**Dolby FM41 Player**](https://github.com/DolbyLaboratories/fm-41-player)            
   → 'fm-41-player' is a C++ command-line transmitter for SMPTE ST 2110-41 fast metadata. This player supports two payloads or modes of operation:
       - Serialized ADM (S-ADM) as per SMPTE ST 2127-2
       - ISXD: Mapping document is stil in draft but the reserved DIT of 0x101 is used. The selected mode of operation is inferred by the supplied input XML file

* [**Dolby Audio Metadata (AM) Viewer**](https://github.com/DolbyLaboratories/AM-Viewer)    
   → Python based realtime viewer for Serialized ADM inside a SMPTE ST 2110 container.     
   Two flavours of SMPTE ST 2110 are supported:
        - SMPTE ST 2110-31 and
        - SMPTE ST 2110-41
        The Dolby Audio Metadata (AM) Viewer is designed to view the serialized ADM metadata produced by [PMD Studio](https://github.com/DolbyLaboratories/pmd_tool)

 * For migration of DolbyE (deprecated) to S-ADM as **Dolby Repository** file, these resources are required:

    - [**Frame 337**](https://github.com/DolbyLaboratories/frame337)   
       conversion of an elementary stream file into a format that can be placed directly onto an AES3 transport
    - [**DolbyE3SADM**](https://github.com/DolbyLaboratories/dolbye2sadm)
       convert a packed Dolby E file (.dde) to Serialized ADM as per the new [Dolby E S-ADM profile](https://professionalsupport.dolby.com/s/article/Dolby-E-ADM-and-S-ADM-Profile-for-emission?language=en_US)            
    - [**S-ADM-Tools**](https://github.com/DolbyLaboratories/sadm-tools)   
       Python package providing several tools for manipulation of Serialized ADM


#### Dolby Atmos ADM Authoring
* [**Dolby Atmos Renderer**](https://professional.dolby.com/product/dolby-atmos-content-creation/dolby-atmos-renderer/)    
   Legacy and premature implementation of ADM based upon [ITU-R BS.2076-0](https://www.itu.int/dms_pubrec/itu-r/rec/bs/R-REC-BS.2076-0-201506-S!!PDF-E.pdf) (2015)    
   → Only limited compatibility with present ADM implementations and workflows

**-> The *Dolby Atmos Render* is included in all major DAW and therefore enables ADM authoring according to the [*Dolby Atmos Master ADM Profile*](https://dolby.my.site.com/professionalsupport/s/article/Dolby-Atmos-ADM-Profile-specification?language=en_US)**

**-> *Blackmagic Design* [*DaVinci Resolve*](https://www.blackmagicdesign.com/products/davinciresolve) is presently the only NLE on the market to fully support *Dolby Atmos* ADM authoring.**


### FRAUNHOFER IIS

* [**MPEG-H Authoring Suite (MAS)**](https://mpegh.com/academy/mas/)    
   Full set of authoring tools:
    - The MPEG-H Authoring Tool (MAS)  
    - The MPEG-H Authoring Plug-in (MHAPi)
    - The MPEG-H Production Format Player (MPF Player)
    - The MPEG-H Info Tool (MHIT)
    - The MPEG-H Conversion Tool (MCO)
    - The MPEG-H Encoding and Muxing Tool (MHEX)
    - The MPEG-H VVPlayer (MHVP)
    - The MPEG Audio Test Player

   MPEG-H is based upon [ITU-R BS.2076-2](https://www.itu.int/dms_pubrec/itu-r/rec/bs/R-REC-BS.2076-2-201910-S!!PDF-E.pdf) (2019)    
   → Vast compatibility with present ADM implementation and workflows

* [**MPEG-H Decoder Software**](https://github.com/Fraunhofer-IIS/mpeghdec)
   → Publicly accessible repo to build a MPEG-H NGA codec decoder that resebles many ADM-typical object-based features. Licensing applies.
The repo [MPEG-H & ADM Test Content](https://github.com/Fraunhofer-IIS/mpegh-test-content) contains sample MPEG-H streams to check its functionality.

**-> The *MPEG-H Authoring Tool* is included in all major DAW and therefore enables ADM authoring according to the [*MPEG-H ADM Profile*](https://www.iis.fraunhofer.de/en/ff/amm/dl/whitepapers/adm-profile.html)**

**-> *Blackmagic Design* [*DaVinci Resolve*](https://www.blackmagicdesign.com/products/davinciresolve) is presently the only NLE on the market to fully support *MPEG-H* ADM authoring.**




### ADM OSC

* [**ADM OSC**](https://github.com/immersive-audio-live/ADM-OSC)    
   -> joint Open Source project to apply ADM for live equipment, intitiated by Radio France, FLUX and L-Acoustics, supported by d&b, Dolby, Lawo, Merging Tecnologies, Steinberg and others. 



## TESTING & QC TOOLS


### MediaArea
* [**MediaInfo**](https://mediaarea.net/en/MediaInfo/Download)    
   -> For years, this de-facto standard tool for gathering media specs supports all ADM profiles and display its properties in depth. As a bonus, it also creates a visual representation of its structure    

* [**MediaConch**](https://mediaarea.net/MediaConch)    
   -> This tool allows to individually define constraints for conformance checks of delivery specifications. You may adapt this for your specific ADM requirements

* [**QCTools**](https://mediaarea.net/QCTools)    
   -> A multi-purpose quality controll app for AV assets

* [**BWF MetaEdit**](https://mediaarea.net/BWFMetaEdit)    
   -> Standard tool to parse and edit BWF contained metadata (BW64 pending). It also supports display, editing and export of ADM's <axml\> chunk (<chna\> is retained only)     




### SMPTE
* [**Online Reg-XML MXF Dump Tool**](https://registry.smpte-ra.org/apps/regxmldump/view/development/)    
   USER: smpte    
   PASSWORD: smpte
   -> Universal tool to parse MXF header metadata. Given that ADM is wrapped properly into MXF (profile signalling, MCA labelling etc.), its key specs will be containd here, too.

### MYRIADBITS

* [**MXFInspect**](https://github.com/Myriadbits/MXFInspect)    
   -> A free tool (Windows only) to display the internal structure of a MXF
