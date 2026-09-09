# Action Items

Presently we're working on this

* ***Constrained BW64 Specification***    
    The BW64 file format supports the carriage of ADM and Serial ADM (S-ADM) metadata using RIFF-style chunks such as <axml\>, <bxml\>, <sxml\>, and <chna\>.     
    However, [ITU-R BS.2088](https://www.itu.int/rec/R-REC-BS.2088/en) permits flexible usage, including multiple coexisting metadata chunks and optional metadata presence, without defining strict rules for their interaction or precedence.
    This flexibility leads to ambiguity in interpretation, inconsistent implementations, and a lack of guaranteed interoperability.
    The *Constrained BW64 Specification* addresses these issues by defining a set of BW64 profiles for ADM and S-ADM carriage. It will be submitted to ITU as a request for consideration to update the respective documents.

 * ***ADM4Legacy TPR Profile***    
   Matching the conventional, channel-based track-allocations as defined in the 2025 [ARD/ZDF/ORF's Delivery Specifications TPR](https://www.ard.de/die-ard/b2b/tpr-2025-technische-produktionsrichtlinien-zur-herstellung-von-medienproduktionen-100.pdf) into ADM according to [SMPTE ST 2131](https://pub.smpte.org/doc/st2131/).    
   This is to be the blueprint for similar delievery broadcast specifiactions and recommendations such as  [EBU R123](https://tech.ebu.ch/publications/r123) or [ITU-R BS.2102](https://www.itu.int/rec/R-REC-BS.2102/en)

* **EBU UHD/HDR Recommendation [R153](https://tech.ebu.ch/publications/r153) for live and [R154](https://tech.ebu.ch/publications/r154) for file-based programmes**   
   First published in 2021, both EBU recommendations early on pointed the way to adapt novel principles through  intelligent and lean 'audio-object-track-assignments' applying ADM.  
   The ADM related audio section of both need to be updated as meanwhile essential new standards have been set in [ITU-R BS.2168-0](https://www.itu.int/dms_pubrec/itu-r/rec/bs/R-REC-BS.2168-0-202502-I!!PDF-E.pdf), [SMPTE ST 2110-31](https://pub.smpte.org/doc/st2110-31/), [SMPTE ST 2110-41](https://pub.smpte.org/doc/st2110-41/), [SMPTE ST 2127](https://pub.smpte.org/doc/st2127-10/) and [SMPTE ST2131](https://pub.smpte.org/doc/st2131/).

 * **Enhance ADM interop of [bmx](https://github.com/ebu/bmx)**     
    with functionalities such as
    - *profile signalling* (https://github.com/ebu/bmx/issues/29)
    - *mca label* creation
    - *direct injection* of ADM metadata into MXF







 * MORE....








 ----
 **->If you want to discuss and contribute to these Open Source efforts, join ADM-IG via
  [<img src="img/EBU-ADM-IG-Site.jpeg">](https://tech.ebu.ch/groups/adm-ig)**
