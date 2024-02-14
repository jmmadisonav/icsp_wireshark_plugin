## Description
The ICSP Wireshark plugin is a dissector specifically tailored for AMX ICSP packets, offering detailed insights into their content.

## Setup & Process
1. Download the files [icsp_protocol.lua](icsp_protocol.lua) and [icsp_definitions.lua](icsp_definitions.lua).

2. Copy the downloaded files `svsi_protocol.lua` and `icsp_definitions.lua` to your Wireshark LUA plugins folder.

3. Locate your Wireshark LUA plugins folder by navigating to Help -> About Wireshark. Then, select the "Folders" tab and look for either "Global Lua Plugins" or "Personal Lua Plugins."

4. Once the file is copied, load the plugin by selecting Analyze -> Reload Lua Plugins.

## Usage
### Filtering
The plugin provides the following filters for effective packet analysis:

#### Common Filters
- `icsp`: Display all ICSP packets.
- `icsp.destination_device`: Display only ICSP packets with a destination device. icsp.destination_device==32001
- many more filters are available

#### Documentation source
- This packet filter is based on the information here:
-  https://patentimages.storage.googleapis.com/1a/b1/01/c0b53224c94df4/US7673030.pdf
- Some information is out of date

