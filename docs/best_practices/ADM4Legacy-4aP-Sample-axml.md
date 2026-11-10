```xml
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<ebuCoreMain xmlns="urn:ebu:metadata-schema:ebuCore_2014" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schema="EBU_CORE_20140201.xsd" xml:lang="en">
  <coreMetadata>
    <format>
      <audioFormatExtended version="ITU-R_BS.2076-3">
        <profileList>
          <profile profileLevel="1" profileName="EBU ADM Production Profile" profileVersion="1">EBU Tech 3393</profile>
        </profileList>
        <audioProgramme audioProgrammeID="APR_1001" audioProgrammeLanguage="eng" audioProgrammeName="Complete  Main 2.0">
          <audioContentIDRef>ACO_1001</audioContentIDRef>
          <loudnessMetadata loudnessMethod="ITU-R BS.1770">
            <integratedLoudness>-20.0</integratedLoudness>
            <loudnessRange>13.5</loudnessRange>
            <maxTruePeak>-1.6</maxTruePeak>
          </loudnessMetadata>
        </audioProgramme>
        <audioProgramme audioProgrammeID="APR_1002" audioProgrammeLanguage="zxx" audioProgrammeName="Music and Effects 2.0">
          <audioContentIDRef>ACO_1002</audioContentIDRef>
          <loudnessMetadata loudnessMethod="ITU-R BS.1770">
            <integratedLoudness>-20.0</integratedLoudness>
            <loudnessRange>20.8</loudnessRange>
            <maxTruePeak>-2.7</maxTruePeak>
          </loudnessMetadata>
        </audioProgramme>
        <audioProgramme audioProgrammeID="APR_1003" audioProgrammeLanguage="deu" audioProgrammeName="Audiodescription 2.0">
          <audioContentIDRef>ACO_1003</audioContentIDRef>
          <loudnessMetadata loudnessMethod="ITU-R BS.1770">
            <integratedLoudness>-18.9</integratedLoudness>
            <loudnessRange>22.1</loudnessRange>
            <maxTruePeak>-1.8</maxTruePeak>
          </loudnessMetadata>
        </audioProgramme>
        <audioProgramme audioProgrammeID="APR_1004" audioProgrammeLanguage="fra" audioProgrammeName="Original Version 2.0">
          <audioContentIDRef>ACO_1004</audioContentIDRef>
          <loudnessMetadata loudnessMethod="ITU-R BS.1770">
            <integratedLoudness>-19.7</integratedLoudness>
            <loudnessRange>21.1</loudnessRange>
            <maxTruePeak>-2.5</maxTruePeak>
          </loudnessMetadata>
        </audioProgramme>
        <audioContent audioContentID="ACO_1001" audioContentLanguage="eng" audioContentName="Complete  Main 2.0">
          <audioContentLabel language="eng">Complete  Main 2.0</audioContentLabel>
          <audioContentLabel language="deu">SENDETON 2.0</audioContentLabel>
          <audioObjectIDRef>AO_1001</audioObjectIDRef>
          <dialogue mixedContentKind="1">2</dialogue>
          <loudnessMetadata loudnessMethod="ITU-R BS.1770">
            <integratedLoudness>-20.0</integratedLoudness>
            <loudnessRange>13.5</loudnessRange>
            <maxTruePeak>-1.6</maxTruePeak>
          </loudnessMetadata>
        </audioContent>
        <audioContent audioContentID="ACO_1002" audioContentLanguage="zxx" audioContentName="Music and Effects 2.0">
          <audioContentLabel language="eng">Music &amp; Effects</audioContentLabel>
          <audioContentLabel language="deu">IT/ME</audioContentLabel>
          <audioObjectIDRef>AO_1002</audioObjectIDRef>
          <dialogue nonDialogueContentKind="3">0</dialogue>
          <loudnessMetadata loudnessMethod="ITU-R BS.1770">
            <integratedLoudness>-20.0</integratedLoudness>
            <loudnessRange>20.8</loudnessRange>
            <maxTruePeak>-2.7</maxTruePeak>
          </loudnessMetadata>
        </audioContent>
        <audioContent audioContentID="ACO_1003" audioContentLanguage="deu" audioContentName="Audiodescription 2.0">
          <audioContentLabel language="eng">Audiodescription Mix</audioContentLabel>
          <audioContentLabel language="deu">Audiodeskiption</audioContentLabel>
          <audioObjectIDRef>AO_1003</audioObjectIDRef>
          <dialogue mixedContentKind="1">2</dialogue>
          <loudnessMetadata loudnessMethod="ITU-R BS.1770">
            <integratedLoudness>-18.9</integratedLoudness>
            <loudnessRange>22.1</loudnessRange>
            <maxTruePeak>-1.8</maxTruePeak>
          </loudnessMetadata>
        </audioContent>
        <audioContent audioContentID="ACO_1004" audioContentLanguage="fra" audioContentName="Original Version 2.0">
          <audioContentLabel language="eng">Original Version</audioContentLabel>
          <audioContentLabel language="deu">Originalfassung</audioContentLabel>
          <audioObjectIDRef>AO_1004</audioObjectIDRef>
          <dialogue mixedContentKind="1">2</dialogue>
          <loudnessMetadata loudnessMethod="ITU-R BS.1770">
            <integratedLoudness>-19.7</integratedLoudness>
            <loudnessRange>21.1</loudnessRange>
            <maxTruePeak>-2.5</maxTruePeak>
          </loudnessMetadata>
        </audioContent>
        <audioObject audioObjectID="AO_1001" audioObjectName="Complete  Main 2.0" interact="0">
          <audioPackFormatIDRef>AP_00010002</audioPackFormatIDRef>
          <audioTrackUIDRef>ATU_00000001</audioTrackUIDRef>
          <audioTrackUIDRef>ATU_00000002</audioTrackUIDRef>
        </audioObject>
        <audioObject audioObjectID="AO_1002" audioObjectName="Music and Effects 2.0" interact="0">
          <audioPackFormatIDRef>AP_00010002</audioPackFormatIDRef>
          <audioTrackUIDRef>ATU_00000003</audioTrackUIDRef>
          <audioTrackUIDRef>ATU_00000004</audioTrackUIDRef>
        </audioObject>
        <audioObject audioObjectID="AO_1003" audioObjectName="Audiodescription 2.0" interact="0">
          <audioPackFormatIDRef>AP_00010002</audioPackFormatIDRef>
          <audioTrackUIDRef>ATU_00000005</audioTrackUIDRef>
          <audioTrackUIDRef>ATU_00000006</audioTrackUIDRef>
        </audioObject>
        <audioObject audioObjectID="AO_1004" audioObjectName="Original Version 2.0" interact="0">
          <audioPackFormatIDRef>AP_00010002</audioPackFormatIDRef>
          <audioTrackUIDRef>ATU_00000007</audioTrackUIDRef>
          <audioTrackUIDRef>ATU_00000008</audioTrackUIDRef>
        </audioObject>
        <audioTrackUID UID="ATU_00000001">
          <audioChannelFormatIDRef>AC_00010001</audioChannelFormatIDRef>
          <audioPackFormatIDRef>AP_00010002</audioPackFormatIDRef>
        </audioTrackUID>
        <audioTrackUID UID="ATU_00000002">
          <audioChannelFormatIDRef>AC_00010002</audioChannelFormatIDRef>
          <audioPackFormatIDRef>AP_00010002</audioPackFormatIDRef>
        </audioTrackUID>
        <audioTrackUID UID="ATU_00000003">
          <audioChannelFormatIDRef>AC_00010001</audioChannelFormatIDRef>
          <audioPackFormatIDRef>AP_00010002</audioPackFormatIDRef>
        </audioTrackUID>
        <audioTrackUID UID="ATU_00000004">
          <audioChannelFormatIDRef>AC_00010002</audioChannelFormatIDRef>
          <audioPackFormatIDRef>AP_00010002</audioPackFormatIDRef>
        </audioTrackUID>
        <audioTrackUID UID="ATU_00000005">
          <audioChannelFormatIDRef>AC_00010001</audioChannelFormatIDRef>
          <audioPackFormatIDRef>AP_00010002</audioPackFormatIDRef>
        </audioTrackUID>
        <audioTrackUID UID="ATU_00000006">
          <audioChannelFormatIDRef>AC_00010002</audioChannelFormatIDRef>
          <audioPackFormatIDRef>AP_00010002</audioPackFormatIDRef>
        </audioTrackUID>
        <audioTrackUID UID="ATU_00000007">
          <audioChannelFormatIDRef>AC_00010001</audioChannelFormatIDRef>
          <audioPackFormatIDRef>AP_00010002</audioPackFormatIDRef>
        </audioTrackUID>
        <audioTrackUID UID="ATU_00000008">
          <audioChannelFormatIDRef>AC_00010002</audioChannelFormatIDRef>
          <audioPackFormatIDRef>AP_00010002</audioPackFormatIDRef>
        </audioTrackUID>
      </audioFormatExtended>
    </format>
  </coreMetadata>
```
