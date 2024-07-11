message_commands = {

    [0x0001] = "Ack",
    [0x0002] = "Nak",
    [0x0084] = "Input Channel:On Status",
    [0x0085] = "Input Channel:Off Status",
    [0x0006] = "Output Channel:On",
    [0x0086] = "Output Channel:On Status",
    [0x0007] = "Output Channel:Off",
    [0x0087] = "Output Channel:Off Status:",
    [0x0088] = "Input/Output Channel:On Status",
    [0x0089] = "Input/Output Channel:Off Status",
    [0x0018] = "Feedback:On",
    [0x0019] = "Feedback:Off",
    [0x000a] = "Level Value To (Master -> Device)",
    [0x008a] = "Level Value (Device -> Master)",
    [0x008d] = "Custom Event",
    [0x000c] = "Command To (Device -> Master)",
    [0x008c] = "Command From (Master -> Device)",
    [0x000b] = "String To (Device -> Master)",
    [0x008b] = "String From (Master -> Device)",
    [0x0501] = "Ping Request",
    [0x0581] = "Ping Response",
    [0x0502] = "Blink",
    [0x0582] = "Request Blink",
    [0x0503] = "Dynamic Device Addrees (Master -> Device)",
    [0x0583] = "Request Dynamic Device (Device -> Master)",
    [0x0584] = "Pass Through",
    [0x0507] = "Request Notification",
    [0x0681] = "Undocumented",
    [0x0201] = "Set Device Number",
    [0x0202] = "Set Identify Mode/Address",
    [0x0203] = "Set Serial Number",
    [0x0204] = "File Transfer",
    [0x0205] = "Request Ip Address List",
    [0x0206] = "IP Address List",
    [0x0207] = "Add IP Address",
    [0x0208] = "Delete IP Address",
    [0x0209] = "Set DNS IP Address",
    [0x020a] = "Request DNS IP Address",
    [0x020b] = "Get DNS IP Address",
    [0x020c] = "Set Ethernet IP Address",
    [0x020d] = "Request Ethernet IP Address",
    [0x020e] = "Get Ethernet IP Address",
    [0x020f] = "Set Time & Date",
    [0x0210] = "Request Time & Date",
    [0x0211] = "Get Time & Date",
    [0x0282] = "Identify Mode/Address",
    [0x0212] = "Restart",
    [0x0213] = "Completion Code",
    [0x000e] = "Request Level Value (Master -> Master)",
    [0x000f] = "Request Output Channel Status (Master -> Master)",
    [0x0010] = "Request Port Count (Master -> Master)",
    [0x0090] = "Port Count (Device -> Master, Master -> Master)",
    [0x0011] = "Request Output Channnel Count (Master -> Master)",
    [0x0091] = "Output Channel Count (Device -> Master, Master -> Master)",
    [0x0012] = "Request Level Count (Master -> Master)",
    [0x0092] = "Level Count (Device -> Master, Master -> Master)",
    [0x0013] = "Request String Size (Master -> Master)",
    [0x0093] = "String Size (Device -> Master, Master -> Master)",
    [0x0014] = "Request Command Size (Master -> Master)",
    [0x0094] = "Command Size (Device -> Master)",
    [0x0015] = "Request Level Size (Master -> Master)",
    [0x0095] = "Level Size (Device -> Master, Master -> Master)",
    [0x0016] = "Request Status (Master -> Master)",
    [0x0096] = "Status (Device -> Master, Master -> Master)",
    [0x0017] = "Request Device Info (Master -> Device)",
    [0x0097] = "Device Info (Device -> Master)",
    [0x0098] = "Device Info EOT (Master -> Device)",
    [0x00a1] = "Request Master Status (Device -> Master, Master -> Master)",
    [0x0021] = "Master Status (Device -> Master, Master -> Master)",
    [0x0101] = "Internal Diagnostic",
    [0x0102] = "Request Diagnostic Information",
    [0x0103] = "Request Devices Online",
    [0x0109] = "Request Devices Online EOT",
    [0x0104] = "Request Device Status",
    [0x010a] = "Request Device Status EOT",
    [0x010b] = "Undocumented",
    [0x010c] = "Undocumented",
    [0x010d] = "Undocumented",
    [0x00a8] = "Undocumented",
    [0x0105] = "Request Asynchronous Notification List",
    [0x0106] = "Asynchronous Notification List",
    [0x0107] = "Add/modify asynchronous Notification List",
    [0x0108] = "Delete asynchronous Notification List",
    [0x0601] = "Undocumented 0x0601",
    [0x0681] = "Undocumented 0x0681"
}

value_type_specifiers = {
    [0x10] = "Byte",
    [0x11] = "Char",
    [0x20] = "Wide Char/Integer",
    [0x21] = "Signed Integer",
    [0x40] = "Unsigned Long",
    [0x41] = "Signed Long",
    [0x4f] = "Float",
    [0x8f] = "Double"
}

value_type_specifiers_length = {
    [0x10] = 1,
    [0x11] = 1,
    [0x20] = 2,
    [0x21] = 2,
    [0x40] = 4,
    [0x41] = 4,
    [0x4f] = 4,
    [0x8f] = 8
}

string_value_type_specifiers = {
    [0x01] = "Char",
    [0x02] = "Wide Char"
}

extened_address_types = {
    [0x01] = "Neuron ID", -- Length will be 6 and address will be the 48-bit Neuron ID of the device."
    [0x02] = "IP4Address", -- Length will be 4 and address will be the 4-byte IP address of the device.",
    [0x03] = "AXLink Connection", -- Length must be 0.",
    [0x06] = "Undocumented but seem common on newer devices", --MUSE/VARIA/NX,
    [0x13] = "RS232 Connection" -- Length must be 0."
}

day_of_week = {
    [0] = "Monday",
    [1] = "Tuesday",
    [2] = "Wednesday",
    [3] = "Thursday",
    [4] = "Friday",
    [5] = "Saturday",
    [6] = "Sunday"
}

temperature = {
    [0x8000] = "Not available"
}

master_status = {
    [0] = "Reset",
    [1] = "Reload",
    [2] = "Undefined status",
    [3] = "Normal"
}

diagnostic_flags = {
    [0x0000] = "Disable diagnostics",
    [0x0001] = "Enable diagnostics"
}

passthrough_enabled = {
    [0] = "Disable",
    [1] = "Enable"
}

configuration_flags = {
    [0x01] = "Device Field Valid",
    [0x02] = "System Field Valid",
    [0x04] = "Future",
    [0x08] = "Future",
    [0x10] = "Future",
    [0x20] = "Future",
    [0x40] = "Future",
    [0x80] = "Erase all Current System / Device settings",
}

file_types = {
    [0] = "Unused",
    [1] = "IR Data",
    [2] = "Firmware",
    [3] = "Touch Panel File",
    [4] = "Axcess2 Tokens"
}

function find_index_of_next_null(search_array, offset)
    start = offset
    for i = 0, search_array:len() - offset
        do
            if search_array(offset + i, 1):uint() == 0 then
                return start, i, start + i + 1
          end
    end
    -- No nulls found
    return start, -1
end

function calculate_iscp_checksum(message_data_array)
    my_sum = 0
    for i=0, message_data_array:len() - 1
      do
        my_sum = my_sum + message_data_array(i, 1):uint()
    end
    return bit.band(my_sum, 0xff)
end

function get_source_and_destination(buffer)
    destination = buffer(7,2):uint()  .. ":" .. buffer(9,2):uint() .. ":" .. buffer(5,2):uint()
    source =      buffer(13,2):uint() .. ":" .. buffer(15,2):uint().. ":" .. buffer(11,2):uint()
    return source, destination
end