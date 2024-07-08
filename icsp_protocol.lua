require "icsp_definitions"

local my_info = {
    version = "0.0.1",
    author = "Jim Maciejewski",
    repository = "https://github.com/jmmadisonav/icsp_wireshark_plugin.git"
  }
  
  set_plugin_info(my_info)
  
  icsp_protocol = Proto("ICSP", "ICSP")
  icsp_broadcast_protocol = Proto("ICSP-Bcast", "ICSP-Bcast")
  
  protocol_field = ProtoField.uint8("icsp.protocol_field", "Protocol Field", base.DEC)
  length_of_data = ProtoField.uint8("icsp.length_of_data", "Length Of Data", base.DEC)
  flags = ProtoField.uint16("icsp.flags", "Flags", base.HEX)
  destination_dps = ProtoField.none("icsp.destination_dps", "Destination DPS")
  destination_system = ProtoField.uint16("icsp.destination_system", "Destination System", base.DEC)
  destination_device = ProtoField.uint16("icsp.destination_device", "Destination Device", base.DEC)
  destination_port = ProtoField.uint16("icsp.destination_port", "Destination Port", base.DEC)
  source_dps = ProtoField.none("icsp.source_dps", "Source DPS", base.NONE)
  source_system = ProtoField.uint16("icsp.source_system", "Source System", base.DEC)
  source_device = ProtoField.uint16("icsp.source_device", "Source Device", base.DEC)
  source_port = ProtoField.uint16("icsp.source_port", "Source Port", base.DEC)
  allowed_hop_count = ProtoField.uint8("icsp.allowed_hop_count", "Allowed Hop Count", base.DEC)
  message_id = ProtoField.uint16("icsp.message_id", "Message ID", base.HEX)
  message_command = ProtoField.uint16("icsp.message_command", "Message Command", base.HEX, message_commands)
  message_data_device = ProtoField.uint16("icsp.message_data_device", "Device", base.DEC)
  message_data_device_number = ProtoField.uint16("icsp.message_data_device_number", "Device Number", base.DEC)
  message_data_device_status = ProtoField.uint16("icsp.message_data_device_status", "Device Status", base.DEC)
  message_data_system = ProtoField.uint16("icsp.message_data_system", "System", base.DEC)
  message_data_system_status = ProtoField.uint16("icsp.message_data_system_status", "System Status", base.DEC, master_status)
  message_data_port = ProtoField.uint16("icsp.message_data_port", "Port", base.DEC)
  message_data_port_status = ProtoField.uint16("icsp.message_data_port_status", "Port Status", base.DEC)
  message_data_channel = ProtoField.uint16("icsp.message_data_channel", "Channel", base.DEC)
  message_data_output_channel_count = ProtoField.uint16("icsp.message_data_output_channel_count", "Output Channel Count", base.DEC)
  message_data_level = ProtoField.uint16("icsp.message_data_level", "Level", base.DEC)
  message_data_level_count = ProtoField.uint16("icsp.message_data_level_count", "Level Count", base.DEC)
  message_data_value_type_specifier = ProtoField.uint8("icps.message_data_value_type_specifier", "Value Type Specifier", base.HEX, value_type_specifiers)
  message_data_string_value_type_specifier = ProtoField.uint8("icps.message_data_string_value_type_specifier", "String Value Type Specifier", base.HEX, string_value_type_specifiers)
  message_data_level_value = ProtoField.uint16("icsp.message_data_level_value", "Level Value", base.DEC)
  message_data_count_of_value_types = ProtoField.uint16("icsp.message_data_count_of_value_types", "Count of value types", base.DEC)
  message_data_command_length = ProtoField.uint8("icsp.message_data_command_length", "Command Length", base.DEC)
  message_data_command = ProtoField.string("icsp.message_data_command", "Command", base.ASCII)
  message_data_flag = ProtoField.uint16("icps.md_flag", "Flag", base.DEC)
  message_data_manufacture_id = ProtoField.uint16("icsp.md_manufacture_id", "Manufacture ID", base.HEX)
  message_data_device_id = ProtoField.uint16("icsp.md_device_id", "Device ID", base.HEX)
  message_data_extended_address_type = ProtoField.uint8("icsp.message_data_extended_address_type", "Extended Address Type", base.HEX, extened_address_types)
  message_data_extended_address_length = ProtoField.uint8("icsp.message_data_extended_address_length", "Extended Address Length", base.DEC)
  message_data_ipv4_address = ProtoField.ipv4("iscp.message_data_ipv4_address", "IPV4 address")
  message_data_object_id = ProtoField.uint8("icsp.message_data_object_id", "Object ID", base.HEX)
  message_data_parent_id = ProtoField.uint8("icsp.message_data_parent_id", "Parent ID", base.HEX)
  message_data_mfg_id = ProtoField.uint16("icsp.message_data_mfg_id", "Mfg ID", base.HEX)
  message_data_devicd_id = ProtoField.uint16("icsp.message_data_devicd_id", "Device ID", base.HEX)
  message_data_serial_number = ProtoField.string("icsp.message_data_serial_number", "Serial Number", base.ASCII)
  message_data_FWID = ProtoField.uint16("icsp.message_data_FWID", "FWID", base.HEX)
  message_data_version = ProtoField.string("icsp.message_data_version", "Version", base.ASCII)
  message_data_device_name = ProtoField.string("icsp.message_data_device_name", "Device Name", base.ASCII)
  message_data_manufacture_string= ProtoField.string("icsp.message_data_manufacture_string", "Manufacture String", base.ASCII)
  message_data_checksum = ProtoField.uint8("icsp.message_data_checksum", "Checksum", base.HEX)
  message_data_month = ProtoField.uint8("icsp.message_data_month", "Month", base.DEC)
  message_data_day = ProtoField.uint8("icsp.message_data_day", "Day", base.DEC)
  message_data_year = ProtoField.uint16("icsp.message_data_year", "Year", base.DEC)
  message_data_hour = ProtoField.uint8("icsp.message_data_hour", "Hour", base.DEC)
  message_data_minute = ProtoField.uint8("icsp.message_data_minute", "Minute", base.DEC)
  message_data_second = ProtoField.uint8("icsp.message_data_second", "Second", base.DEC)
  message_data_day_of_week = ProtoField.uint8("icsp.message_data_day_of_week", "Day Of Week", base.DEC, day_of_week)
  message_data_outside_temperature = ProtoField.uint16("icsp.message_data_outside_temperature", "Outside Temperature", base.HEX, temperature)
  message_data_text_date_string = ProtoField.string("icsp.message_data_text_date_string", "Text Date String", base.ASCII)
  message_data_mac_address = ProtoField.ether("icsp.message_data_mac_address", "MAC Address", base.HEX)
  message_data_device_model = ProtoField.string("icsp.message_data_device_model", "Device Model", base.ASCII)
  message_data_status_length = ProtoField.uint8("icsp.message_data_status_length", "Length", base.DEC)
  message_data_status_string = ProtoField.string("icsp.message_data_status_string", "Status String", base.ASCII)
  skipped_bytes = ProtoField.none("icsp.skipped_bytes", "Undocumented Bytes", base.HEX)
  blink_heartbeat = ProtoField.uint8("icps.blink_heartbeat", "Heartbeat", base.DEC)
  blink_LED = ProtoField.uint8("icps.blink_LED", "LED")
  message_data_port_count = ProtoField.uint16("icsp.message_data_port_count", "Port Count", base.DEC)
  message_data_program_info = ProtoField.string("icsp.message_data_program_info", "Program Info", base.ASCII)
  message_data_diagnostic_object_id = ProtoField.uint16("icsp.message_data_diagnostic_object_id", "Diagnostic Object ID", base.HEX)
  message_data_diagnostic_severity = ProtoField.uint16("icsp.message_data_diagnostic_severity", "Diagnostic Severity", base.HEX)
  message_data_diagnostic_string = ProtoField.string("icsp.message_data_diagnostic_string", "Diagnostic String", base.ASCII)
  message_data_diagnostic_flag = ProtoField.uint16("icsp.message_data_diagnostic_flag", "Diagnostic Flag", base.HEX, diagnostic_flags)
  message_data_notification_total_count = ProtoField.uint16("icsp.message_data_notification_total_count", "Notification Total Count", base.DEC)
  message_data_notification_this_index = ProtoField.uint16("icsp.message_data_notification_this_index", "Notifcation This Index", base.DEC)
  message_data_notification_flag = ProtoField.uint32("icsp.message_data_notification_flag", "Notifcation Flag", base.HEX)
  message_data_notification_bits = ProtoField.none("icsp.message_data_notification_bits", "Notification Bits")
  message_data_proposed_device = ProtoField.uint16("icsp.message_data_proposed_device", "Proposed Device", base.DEC)
  message_data_pass_through_enable = ProtoField.uint8("icsp.message_data_pass_through_enable", "Pass Through enable", base.DEC)
  message_data_message_count = ProtoField.uint16("icsp.message_data_message_count", "Message Count", base.DEC)
  message_data_messages = ProtoField.uint16("icsp.message_data_messages", "Messages", base.HEX)
  message_data_configuration_flag = ProtoField.uint8("icsp.message_data_configuration_flag", "Configuration Flags", base.HEX, configuration_flags)
  message_data_file_type = ProtoField.uint16("icsp.message_data_file_type", "File Type", base.HEX, file_types)
  message_data_file_function = ProtoField.uint16("icsp.message_data_file_function", "File Function", base.HEX)
  message_data_file_data = ProtoField.none("icsp.message_data_file_data", "File data", base.HEX)
  message_data_debug = ProtoField.none("icsp.debug", "Debug", base.ACSII)

  icsp_protocol.fields = {protocol_field, length_of_data, flags, destination_dps, destination_device, destination_port, 
                          destination_system, source_dps, source_device, source_port, source_system, allowed_hop_count,
                          message_id, message_command, message_data_device, message_data_system, message_data_flag, message_data_manufacture_id,
                          message_data_device_id, message_data_extended_address_type, message_data_extended_address_length,
                          message_data_ipv4_address, blink_heartbeat, blink_LED, message_data_object_id, message_data_parent_id,
                          message_data_mfg_id, message_data_devicd_id, message_data_serial_number, message_data_FWID,
                          message_data_version, message_data_device_name, message_data_manufacture_string, message_data_checksum, message_data_month,
                          message_data_day, message_data_year, message_data_hour, message_data_minute, message_data_second,
                          message_data_day_of_week, message_data_outside_temperature, message_data_text_date_string, message_data_mac_address,
                          message_data_device_model, skipped_bytes, message_data_port_count, message_data_program_info, message_data_port,
                          message_data_channel, message_data_level, message_data_value_type_specifier, message_data_level_value,
                          message_data_command_length, message_data_command, message_data_string_value_type_specifier, message_data_output_channel_count,
                          message_data_command_level_count, message_data_count_of_value_types, message_data_device_status, message_data_port_status,
                          message_data_status_length, message_data_status_string, message_data_system_status, message_data_diagnostic_object_id,
                          message_data_diagnostic_severity, message_data_diagnostic_string, message_data_diagnostic_flag,
                          message_data_notification_total_count, message_data_notification_this_index, message_data_notification_flag,
                          message_data_notification_bits, message_data_proposed_device, message_data_pass_through_enable, 
                          message_data_message_count, message_data_messages, message_data_configuration_flag, message_data_device_number,
                          message_data_file_type, message_data_file_function, message_data_file_data, message_data_debug}

  checksum_warning = ProtoExpert.new("checksum", "Invalid Checksum", expert.group.CHECKSUM, expert.severity.WARN )

  icsp_protocol.experts = {checksum_warning}

  function icsp_protocol.dissector(buffer, pinfo, tree)
    length = buffer:len()
    packet_start = 0
    packet_index = 0
    loop_num = 0
    first_packet_length = 0
    if length == 0 then return end

    while( packet_start < length ) do
      loop_num = loop_num + 1
      -- if loop_num == 2
      --   then
      --     if packet_index ~= first_packet_length
      --       then
      --         return
      --       end
      --   end
      local subtree = tree:add(icsp_protocol, buffer(packet_start, buffer(packet_index + 1,2):uint() + 4))
      -- first_packet_length = buffer(packet_index + 1,2):uint() + 4
      pinfo.cols.protocol = "ICSP"

      source, destination = get_source_and_destination(buffer)
      subtree:set_text('ICSP Packet ' .. source .. " --> " .. destination)
      --  .. " loop: " .. loop_num)
      subtree:add(protocol_field, buffer(packet_index + 0,1))
      subtree:add(length_of_data, buffer(packet_index + 1,2))
      subtree:add(flags, buffer(packet_index + 3,2))
      
      destination_subtree = subtree:add(destination_dps, buffer(packet_index + 5,6)):set_text("Destination DPS: " .. destination)                                                                                        
      destination_subtree:add(destination_system, buffer(packet_index + 5,2))
      destination_subtree:add(destination_device, buffer(packet_index + 7,2))
      destination_subtree:add(destination_port, buffer(packet_index + 9,2))
      source_subtree = subtree:add(source_dps, buffer(packet_index + 11,6)):set_text("Source DPS: " .. source)
      source_subtree:add(source_system, buffer(packet_index + 11,2))
      source_subtree:add(source_device, buffer(packet_index + 13,2))
      source_subtree:add(source_port, buffer(packet_index + 15,2))
      subtree:add_le(allowed_hop_count, buffer(packet_index + 17,1))
      subtree:add(message_id, buffer(packet_index + 18,2))
      message_command_subtree = subtree:add(message_command, buffer(packet_index + 20,2))
      mc = message_commands[buffer(packet_index + 20,2):uint()]

      if mc == "Ack"
        then
          packet_index = packet_index + 22
        end

      if mc == "Input Channel:On Status" or
        mc == "Input Channel:Off Status" or
        mc == "Output Channel:On Status" or
        mc == "Output Channel:Off Status" or
        mc == "Input/Output Channel:On Status" or
        mc == "Input/Output Channel:Off Status" or
        mc == "Feedback:On" or
        mc == "Feedback:Off" 
        then
          message_command_subtree:add(message_data_device, buffer(packet_index + 22,2))
          message_command_subtree:add(message_data_port, buffer(packet_index + 24,2))
          message_command_subtree:add(message_data_system, buffer(packet_index + 26,2))
          message_command_subtree:add(message_data_channel, buffer(packet_index + 28,2))
          packet_index = packet_index + 30
        end

      if mc == "Level Value To (Master -> Device)" or
        mc == "Level Value (Device -> Master)"
        then
          message_command_subtree:add(message_data_device, buffer(packet_index + 22,2))
          message_command_subtree:add(message_data_port, buffer(packet_index + 24,2))
          message_command_subtree:add(message_data_system, buffer(packet_index + 26,2))
          message_command_subtree:add(message_data_level, buffer(packet_index + 28,2))
          message_command_subtree:add(message_data_value_type_specifier, buffer(packet_index + 30,1))
          message_command_subtree:add(message_data_level_value, buffer(packet_index + 31, value_type_specifiers_length[buffer(packet_index + 30,1):uint()]))
          packet_index = packet_index + buffer(packet_index + 30,1):uint()
        end

      if mc == "Custom Event"
        then
          message_command_subtree:add(message_data_device, buffer(packet_index + 22,2))
          message_command_subtree:add(message_data_port, buffer(packet_index + 24,2))
          message_command_subtree:add(message_data_system, buffer(packet_index + 26,2))
          message_command_subtree:add(skipped_bytes, buffer(packet_index + 28, 32))
          packet_index = packet_index + 60
        end

      if mc == "Command To (Device -> Master)" or
        mc == "Command From (Master -> Device)" or
        mc == "String To (Device -> Master)" or
        mc == "String From (Master -> Device)"
        then
          message_command_subtree:add(message_data_device, buffer(packet_index + 22,2))
          message_command_subtree:add(message_data_port, buffer(packet_index + 24,2))
          message_command_subtree:add(message_data_system, buffer(packet_index + 26,2))
          message_command_subtree:add(message_data_string_value_type_specifier, buffer(packet_index + 28,1))
          message_command_subtree:add(message_data_command_length, buffer(packet_index + 29, 2))
          message_command_subtree:add(message_data_command, buffer(packet_index + 31, buffer(packet_index + 29,2):uint()))
          packet_index = packet_index + buffer(packet_index + 29,2):uint()
        end

      if mc == "Request Level Value (Master -> Master)"
        then
          message_command_subtree:add(message_data_device, buffer(packet_index + 22,2))
          message_command_subtree:add(message_data_port, buffer(packet_index + 24,2))
          message_command_subtree:add(message_data_system, buffer(packet_index + 26,2))
          message_command_subtree:add(message_data_level, buffer(packet_index + 28,2))
          packet_index = packet_index + 30
        end

      if mc == "Request Output Channel Status (Master -> Master)"
        then
          message_command_subtree:add(message_data_device, buffer(packet_index + 22,2))
          message_command_subtree:add(message_data_port, buffer(packet_index + 24,2))
          message_command_subtree:add(message_data_system, buffer(packet_index + 26,2))
          message_command_subtree:add(message_data_channel, buffer(packet_index + 28,2))
          packet_index = packet_index + 30
        end

      if mc == "Request Port Count (Master -> Master)" or
        mc == "Dynamic Device Addrees (Master -> Device)"
        then
          message_command_subtree:add(message_data_device, buffer(packet_index + 22,2))
          message_command_subtree:add(message_data_system, buffer(packet_index + 24,2))
          packet_index = packet_index + 26
        end

      if mc == "Port Count (Device -> Master, Master -> Master)"
        then -- 0x0090
          message_command_subtree:add(message_data_device, buffer(packet_index + 22,2))
          message_command_subtree:add(message_data_system, buffer(packet_index + 24,2))
          -- Sometimes there is a port count sometime not
          if packet_index + 26 > packet_start + buffer(packet_index + 1,2):uint() + 2
            then
              packet_index = packet_index + 26
            else
              message_command_subtree:add(message_data_port_count, buffer(packet_index + 26,2))
              packet_index = packet_index + 28
            end
        end

      if mc == "Request Output Channnel Count (Master -> Master)" or
        mc == "Request Level Count (Master -> Master)" or
        mc == "Request String Size (Master -> Master)" or
        mc == "Request Command Size (Master -> Master)" or
        mc == "Request Status (Master -> Master)" or
        mc == "Request Device Status" or
        mc == "Request Device Status EOT" or
        mc == "Delete asynchronous Notification List"
        then
          message_command_subtree:add(message_data_device, buffer(packet_index + 22,2))
          message_command_subtree:add(message_data_port, buffer(packet_index + 24,2))
          message_command_subtree:add(message_data_system, buffer(packet_index + 26,2))
          packet_index = packet_index + 28
        end


      if mc == "Output Channel Count (Device -> Master, Master -> Master)"
        then
          message_command_subtree:add(message_data_device, buffer(packet_index + 22,2))
          message_command_subtree:add(message_data_port, buffer(packet_index + 24,2))
          message_command_subtree:add(message_data_system, buffer(packet_index + 26,2))
          message_command_subtree:add(message_data_output_channel_count, buffer(packet_index + 28,2))
          packet_index = packet_index + 30
        end

      if mc == "Level Count (Device -> Master, Master -> Master)" or
        mc == "Request Level Size (Master -> Master)"
        then
          message_command_subtree:add(message_data_device, buffer(packet_index + 22,2))
          message_command_subtree:add(message_data_port, buffer(packet_index + 24,2))
          message_command_subtree:add(message_data_system, buffer(packet_index + 26,2))
          message_command_subtree:add(message_data_level_count, buffer(packet_index + 28,2))
          packet_index = packet_index + 30
        end

      if mc == "String Size (Device -> Master, Master -> Master)" or
        mc == "Command Size (Device -> Master)"
        then
          message_command_subtree:add(message_data_device, buffer(packet_index + 22,2))
          message_command_subtree:add(message_data_port, buffer(packet_index + 24,2))
          message_command_subtree:add(message_data_system, buffer(packet_index + 26,2))
          message_command_subtree:add(message_data_value_type_specifier, buffer(packet_index + 28,1))
          message_command_subtree:add(message_data_command_length, buffer(packet_index + 29, string_value_type_specifiers[buffer(packet_index + 28,1):uint()]))
          packet_index = packet_index + buffer(packet_index + 28,1):uint()
        end

      if mc == "Level Size (Device -> Master, Master -> Master)"
        then
          message_command_subtree:add(message_data_device, buffer(packet_index + 22,2))
          message_command_subtree:add(message_data_port, buffer(packet_index + 24,2))
          message_command_subtree:add(message_data_system, buffer(packet_index + 26,2))
          message_command_subtree:add(message_data_level, buffer(packet_index + 28,2))
          message_command_subtree:add(message_data_count_of_value_types, buffer(packet_index + 30,1))
          for i=0, buffer(packet_index + 30,1):uint()
            do
              message_command_subtree:add(message_data_value_type_specifier, buffer(packet_index + 31 + i, 1))
            end
          packet_index = packet_index + 32 + i
        end
      
      if mc == "Status (Device -> Master, Master -> Master)"
        then
          message_command_subtree:add(message_data_device, buffer(packet_index + 22,2))
          message_command_subtree:add(message_data_port, buffer(packet_index + 24,2))
          message_command_subtree:add(message_data_system, buffer(packet_index + 26,2))
          if buffer(packet_index + 28,2):uint() == 0
            then
              -- Device status
              message_command_subtree:add(message_data_device_status, buffer(packet_index + 28,2))
            else
              -- Port status
              message_command_subtree:add(message_data_port_status, buffer(packet_index + 28,2))
            end
          message_command_subtree:add(message_data_value_type_specifier, buffer(packet_index + 30,1))
          message_command_subtree:add(message_data_status_length, buffer(packet_index + 31,2))
          message_command_subtree:add(message_data_status_string, buffer(packet_index + 33, buffer(packet_index + 31,2):uint()))
          packet_index = packet_index + buffer(packet_index + 31,2):uint()
        end

      if mc == "Request Device Info (Master -> Device)"
        then
          message_command_subtree:add(message_data_device, buffer(packet_index + 22,2))
          message_command_subtree:add(message_data_system, buffer(packet_index + 24,2))
          packet_index = packet_index + 26
        end

      if mc == "Device Info (Device -> Master)"
        then
          message_command_subtree:add(message_data_device, buffer(packet_index + 22,2))
          message_command_subtree:add(message_data_system, buffer(packet_index + 24,2))
          message_command_subtree:add(message_data_flag, buffer(packet_index + 26,2))

          message_command_subtree:add(message_data_object_id, buffer(packet_index + 28,1))
          message_command_subtree:add(message_data_parent_id, buffer(packet_index + 29,1))
          message_command_subtree:add(message_data_mfg_id, buffer(packet_index + 30,2))
          message_command_subtree:add(message_data_device_id, buffer(packet_index + 32,2))
          -- Some devices have extra stuff in the serial area
          start_string, string_length, current_index = find_index_of_next_null(buffer, packet_index + 34)
          if string_length > 16 then
            message_command_subtree:add(message_data_serial_number, buffer(packet_index + 34,16))
          else
            message_command_subtree:add(message_data_serial_number, buffer(packet_index + 34,string_length))
          end
          message_command_subtree:add(message_data_FWID, buffer(packet_index + 50,2))
          start_string, string_length, current_index = find_index_of_next_null(buffer, packet_index + 52)
          message_command_subtree:add(message_data_version, buffer(start_string, string_length))
          start_string, string_length, current_index = find_index_of_next_null(buffer, current_index)
          message_command_subtree:add(message_data_device_name, buffer(start_string, string_length))
          start_string, string_length, current_index = find_index_of_next_null(buffer, current_index)
          message_command_subtree:add(message_data_manufacture_string, buffer(start_string, string_length))
          message_command_subtree:add(message_data_extended_address_type, buffer(current_index,1))
          current_index = current_index + 1
          message_command_subtree:add(message_data_extended_address_length, buffer(current_index,1))
          current_index = current_index + 1
          -- If we have an IPV4 address, lets show it
          if tostring(buffer(current_index-2, 1)) == "02" then
            do
              message_command_subtree:add(message_data_ipv4_address, buffer(current_index, 4))
              current_index = current_index + 4
            end
    
          elseif tostring(buffer(current_index-2, 1)) == "06" then -- Seen on varia
            do
              message_command_subtree:add(message_data_ipv4_address, buffer(current_index, 4))
              current_index = current_index + 4
              -- Ok there are 2 bytes here I'm not sure what for ... lets skip them
              message_command_subtree:add(skipped_bytes, buffer(current_index, 2))
              current_index = current_index + 2
              message_command_subtree:add(message_data_mac_address, buffer(current_index, 6))
              current_index = current_index + 6
            end
          else
            -- I don't know what to do with this address lets skip it...
            print("Extended address " .. buffer(current_index, buffer(current_index-1,1):uint()))
            -- message_command_subtree:add(skipped_bytes, buffer(current_index-1,1):uint())
            current_index = current_index + buffer(current_index-1,1):uint()
          end
          -- Set the packet_index to the current index 
          packet_index = current_index
        end

      if mc == "Device Info EOT (Master -> Device)"
        then
          message_command_subtree:add(message_data_device, buffer(packet_index + 22,2))
          message_command_subtree:add(message_data_system, buffer(packet_index + 24,2))
          packet_index = packet_index + 26
        end

      if mc == "Request Master Status (Device -> Master, Master -> Master)"
        then
          message_command_subtree:add(message_data_system, buffer(packet_index + 22,2))
          packet_index = packet_index + 24
        end

      if mc == "Master Status (Device -> Master, Master -> Master)"
        then
          message_command_subtree:add(message_data_system, buffer(packet_index + 22,2))
          message_command_subtree:add(message_data_system_status, buffer(packet_index + 24,2))
          start_string, string_length, current_index = find_index_of_next_null(buffer, packet_index + 26)
          message_command_subtree:add(message_data_status_string, buffer(start_string, string_length))
          packet_index = current_index
        end

      if mc == "Internal Diagnostic"
        then
          message_command_subtree:add(message_data_diagnostic_object_id, buffer(packet_index + 22,2))
          message_command_subtree:add(message_data_diagnostic_severity, buffer(packet_index + 24,2))
          start_string, string_length, current_index = find_index_of_next_null(buffer, packet_index + 26)
          message_command_subtree:add(message_data_diagnostic_string, buffer(start_string, string_length))
          packet_index = current_index
        end

      if mc == "Request Diagnostic Information"
        then
          message_command_subtree:add(message_data_diagnostic_flag, buffer(packet_index + 22,2))
          packet_index = packet_index + 24
        end

      if mc == "Asynchronous Notification List"
        then
          message_command_subtree:add(message_data_notification_total_count, buffer(packet_index + 22,2))
          message_command_subtree:add(message_data_notification_this_index, buffer(packet_index + 24,2))
          message_command_subtree:add(message_data_device, buffer(packet_index + 26,2))
          message_command_subtree:add(message_data_port, buffer(packet_index + 28,2))
          message_command_subtree:add(message_data_system, buffer(packet_index + 30,2))
          message_command_subtree:add(message_data_notification_flag, buffer(packet_index + 32,4))
          packet = packet_index + 36
        end

      if mc == "Add/modify asynchronous Notification List"
        then
          message_command_subtree:add(message_data_device, buffer(packet_index + 22,2))
          message_command_subtree:add(message_data_port, buffer(packet_index + 24,2))
          message_command_subtree:add(message_data_system, buffer(packet_index + 26,2))
          
          notification_bits = message_command_subtree:add(message_data_notification_flag, buffer(packet_index + 28,4))
          my_undefined_bits = ""
          for i=0, 18
            do
              if i % 4 == 0 and i ~= 0
                then
                  my_undefined_bits = my_undefined_bits .. " "
                end
              my_undefined_bits = my_undefined_bits .. buffer(packet_index + 28,4):bitfield(i,1)
            end
  
          notification_bits:add(message_data_notification_bits):set_text(my_undefined_bits ..                                       ". .... .... .... = Undefined Bits")
          notification_bits:add(message_data_notification_bits):set_text(".... .... .... .... ..." .. buffer(packet_index + 28,4):bitfield(19,1) .. " .... .... .... = Custom messages")
          notification_bits:add(message_data_notification_bits):set_text(".... .... .... .... .... " .. buffer(packet_index + 28,4):bitfield(20,1) .. "... .... .... = Status messages")
          notification_bits:add(message_data_notification_bits):set_text(".... .... .... .... .... ." .. buffer(packet_index + 28,4):bitfield(21,1) .. ".. .... .... = Commands to device")
          notification_bits:add(message_data_notification_bits):set_text(".... .... .... .... .... .." .. buffer(packet_index + 28,4):bitfield(22,1) .. ". .... .... = Commands from device")
          notification_bits:add(message_data_notification_bits):set_text(".... .... .... .... .... ..." .. buffer(packet_index + 28,4):bitfield(23,1) .. " .... .... = Strings to device")
          notification_bits:add(message_data_notification_bits):set_text(".... .... .... .... .... .... " .. buffer(packet_index + 28,4):bitfield(24,1) .. "... .... = Strings from device")
          notification_bits:add(message_data_notification_bits):set_text(".... .... .... .... .... .... ." .. buffer(packet_index + 28,4):bitfield(25,1) .. ".. .... = Level changes to device")
          notification_bits:add(message_data_notification_bits):set_text(".... .... .... .... .... .... .." .. buffer(packet_index + 28,4):bitfield(26,1) .. ". .... = Level changes from device")
          notification_bits:add(message_data_notification_bits):set_text(".... .... .... .... .... .... ..." .. buffer(packet_index + 28,4):bitfield(27,1) .. " .... = Feedback channel changes")
          notification_bits:add(message_data_notification_bits):set_text(".... .... .... .... .... .... .... " .. buffer(packet_index + 28,4):bitfield(28,1) .. "... = Output channel changes")
          notification_bits:add(message_data_notification_bits):set_text(".... .... .... .... .... .... .... ." .. buffer(packet_index + 28,4):bitfield(29,1) .. ".. = Input channel changes")
          notification_bits:add(message_data_notification_bits):set_text(".... .... .... .... .... .... .... .." .. buffer(packet_index + 28,4):bitfield(30,1) .. ". = Configuration messages")
          notification_bits:add(message_data_notification_bits):set_text(".... .... .... .... .... .... .... ..." .. buffer(packet_index + 28,4):bitfield(31,1) .. " = Online/offline messages")
          packet_index = packet_index + 32
        end


      if mc == "Ping Response" then
        message_command_subtree:add(message_data_device, buffer(packet_index + 22,2))
        message_command_subtree:add(message_data_system, buffer(packet_index + 24,2))
        message_command_subtree:add(message_data_manufacture_id, buffer(packet_index + 26,2))
        message_command_subtree:add(message_data_device_id, buffer(packet_index + 28,2))
        message_command_subtree:add(message_data_extended_address_type, buffer(packet_index + 30,1))
        message_command_subtree:add(message_data_extended_address_length, buffer(packet_index + 31,1))
        message_command_subtree:add(message_data_ipv4_address, buffer(packet_index + 32,4))
        if packet_index + 36 > packet_start + buffer(packet_index + 1,2):uint() + 2
            then
              packet_index = packet_index + 36
            else
              -- Padding for some reason?
              packet_index = length - 1
            end

        
        end

      if mc == "Request Devices Online" or 
         mc == "Request Devices Online EOT"
          then 
          packet_index = length - 1
      end

      if mc == "Ping Request" then -- 0x0501
        message_command_subtree:add(message_data_device, buffer(packet_index + 22,2))
        message_command_subtree:add(message_data_system, buffer(packet_index + 24,2))
        packet_index = packet_index + 26
        end

      if mc == "Request Dynamice Device (Device -> Master)"
        then
          message_command_subtree:add(message_data_proposed_device, buffer(packet_index + 22,2))
          message_command_subtree:add(message_data_extended_address_type, buffer(packet_index + 24,1))
          message_command_subtree:add(message_data_extended_address_length, buffer(packet_index + 25,1))
          -- probably should handle other types...
          message_command_subtree:add(message_data_ipv4_address, buffer(packet_index + 26,4))
          packet_index = packet_index + 30
        end

      if mc == "Pass Through"
        then
          message_command_subtree:add(source_device, buffer(packet_index + 22,2))
          message_command_subtree:add(destination_device, buffer(packet_index + 24,2))
          message_command_subtree:add(destination_port, buffer(packet_index + 26,2))
          message_command_subtree:add(destination_system, buffer(packet_index + 28,2))
          message_command_subtree:add(message_data_pass_through_enable, buffer(packet_index + 30,1))
          packet_index = packet_index + 31
        end

      if mc == "Request Notification"
        then
          message_command_subtree:add(destination_system, buffer(packet_index + 22,2))
          message_command_subtree:add(destination_device, buffer(packet_index + 24,2))
          message_command_subtree:add(source_system, buffer(packet_index + 26,2))
          message_command_subtree:add(source_device, buffer(packet_index + 28,2))
          message_command_subtree:add(message_data_message_count, buffer(packet_index + 30,2))
          message_command_subtree:add(message_data_messages, buffer(packet_index + 32, buffer(packet_index + 30,2):uint()))
          packet_index = packet_index + buffer(packet_index + 30,2):uint()
        end

      if mc == "Blink" then
        message_command_subtree:add(blink_heartbeat, buffer(packet_index + 22,1))
        LED_subtree = message_command_subtree:add(blink_LED, buffer(packet_index + 23,1)):set_text("LED " .. "(0x" .. buffer(packet_index + 23,1) .. ")")
        LED_subtree:add(blink_heartbeat, buffer(packet_index + 23,1)):set_text(buffer(packet_index + 23, 1):bitfield(0, 1) .. "... .... = Forced Device Unconfigure/Reset")
        
        LED_subtree:add(blink_heartbeat, buffer(packet_index + 23,1)):set_text("." .. buffer(packet_index + 23, 1):bitfield(1, 1) ..
                                                                                      buffer(packet_index + 23, 1):bitfield(2, 1) ..
                                                                                      buffer(packet_index + 23, 1):bitfield(3, 1) ..
                                                                                      " " ..
                                                                                      buffer(packet_index + 23, 1):bitfield(4, 1) ..
                                                                                      buffer(packet_index + 23, 1):bitfield(5, 1) ..
                                                                                      buffer(packet_index + 23, 1):bitfield(6, 1) ..
                                                                                      "." .. " = Reservered ")
        LED_subtree:add(blink_heartbeat, buffer(packet_index + 23,1)):set_text(".... ..." .. buffer(packet_index + 23, 1):bitfield(7, 1) .. " = Bus LED: " .. buffer(packet_index + 23, 1):bitfield(7, 1))
        message_command_subtree:add(message_data_month, buffer(packet_index + 24,1))
        message_command_subtree:add(message_data_day, buffer(packet_index + 25,1))
        message_command_subtree:add(message_data_year, buffer(packet_index + 26,2))
        message_command_subtree:add(message_data_hour, buffer(packet_index + 28,1))
        message_command_subtree:add(message_data_minute, buffer(packet_index + 29,1))
        message_command_subtree:add(message_data_second, buffer(packet_index + 30,1))
        message_command_subtree:add(message_data_day_of_week, buffer(packet_index + 31,1))
        message_command_subtree:add(message_data_outside_temperature, buffer(packet_index + 32,2))
        start_string, string_length, current_index = find_index_of_next_null(buffer, packet_index + 34)
        
        message_command_subtree:add(message_data_text_date_string, buffer(start_string, string_length))
        -- -- After this are three 00, 
        -- -- then the MAC address
        current_index = current_index + 2
        message_command_subtree:add(message_data_mac_address, buffer(current_index, 6))
        -- and the name in a null terminated string
        current_index = current_index + 6
        start_string, string_length, current_index = find_index_of_next_null(buffer, current_index)     
        message_command_subtree:add(message_data_device_name, buffer(start_string, string_length)) 
        -- and the model in a null terminated string
        start_string, string_length, current_index = find_index_of_next_null(buffer, current_index)
        message_command_subtree:add(message_data_device_model, buffer(start_string, string_length)) 
        packet_index = current_index
        end

    
      if mc == "Set Device Number"
        then
          message_command_subtree:add(message_data_configuration_flag, buffer(packet_index + 22,1))
          message_command_subtree:add(message_data_device_number, buffer(packet_index + 23,2))
          message_command_subtree:add(message_data_system, buffer(packet_index + 25,2))
          packet_index = packet_index + 27
        end
    
      if mc == "Set Serial Number"
        then
          message_command_subtree:add(message_data_serial_number, buffer(packet_index + 22,2))
          packet_index = packet_index + 24
        end
      if mc == "File Transfer"
        then
          message_command_subtree:add(message_data_file_type, buffer(packet_index + 22,2))
          message_command_subtree:add(message_data_file_function, buffer(packet_index + 24,2))
          if length - 27 > 0 then
            message_command_subtree:add(message_data_file_data, buffer(packet_index + 26,length - 27))
          end
          -- What is going on here... need to revisit this one
          packet_index = length - 1
        end

      if buffer(packet_start + 20,2):uint() == 0x010b
        then -- Undocumented
        message_command_subtree:add(skipped_bytes, buffer(packet_index + 22, 2))
        packet_index = packet_index + 24
        end

      if buffer(packet_start + 20,2):uint() == 0x010c
        then -- Undocumented looks like program name
          message_command_subtree:add(skipped_bytes, buffer(packet_index + 22, 2))
          message_command_subtree:add(skipped_bytes, buffer(packet_index + 24, 2))
          message_command_subtree:add(skipped_bytes, buffer(packet_index + 26, 2))
          message_command_subtree:add(skipped_bytes, buffer(packet_index + 28, 2))
          start_string, string_length, current_index = find_index_of_next_null(buffer, packet_index + 30)
          message_command_subtree:add(message_data_device_name, buffer(start_string, string_length))
          start_string, string_length, current_index = find_index_of_next_null(buffer, current_index)
          message_command_subtree:add(message_data_program_info, buffer(start_string, string_length))
          message_command_subtree:add(message_data_extended_address_type, buffer(current_index,1))
          current_index = current_index + 1
          message_command_subtree:add(message_data_extended_address_length, buffer(current_index,1))
          current_index = current_index + 1
          -- If we have an IPV4 address, lets show it
          if tostring(buffer(current_index-2, 1)) == "02"
            then
              message_command_subtree:add(message_data_ipv4_address, buffer(current_index, 4))
              current_index = current_index + 4

            elseif tostring(buffer(current_index-2, 1)) == "06"
              then -- Seen on varia
                message_command_subtree:add(message_data_ipv4_address, buffer(current_index, 4))
                current_index = current_index + 4
                -- Ok there are 2 bytes here I'm not sure what for ... lets skip them
                message_command_subtree:add(skipped_bytes, buffer(current_index, 2))
                current_index = current_index + 2
                message_command_subtree:add(message_data_mac_address, buffer(current_index, 6))
                current_index = current_index + 6


            else
              -- I don't know what to do with this address lets skip it...
              print("Extended address " .. buffer(current_index, buffer(current_index-1,1):uint()))
              current_index = current_index + buffer(current_index-1,1):uint()
            end
        packet_index = length - 1
        end


      if buffer(packet_start + 20,2):uint() == 0x00a8
        then -- Undocumented
        message_command_subtree:add(skipped_bytes, buffer(packet_index + 22, 4))
        packet_index = packet_index + 26
        end

      if buffer(packet_start + 20,2):uint() == 0x010d
        then -- Undocumented
        packet_index = packet_index + 22
        end


      my_checksum = calculate_iscp_checksum(buffer(packet_start, packet_index - packet_start))
      if my_checksum == buffer(packet_index, 1):uint() then
        subtree:add(message_data_checksum, buffer(packet_index, 1)):set_text("Checksum: Valid (0x" .. buffer(packet_index, 1) .. ")")
      else
        subtree:add(message_data_checksum, buffer(packet_index, 1)):set_text("Checksum: Bad (0x" .. buffer(packet_index, 1) .. ")")
        subtree:add_proto_expert_info(checksum_warning)
      end
      packet_index = packet_index + 1
      packet_start = packet_index
      -- subtree:add(message_data_debug):set_text("Packet Index is " .. packet_index .. " Packet Start is " .. packet_start)
      -- if loop_num >  then return end
    end
  end
  
function icsp_broadcast_protocol.dissector(buffer, pinfo, tree)
  length = buffer:len()
  if length == 0 then return end

  local subtree = tree:add(icsp_broadcast_protocol, buffer())
  pinfo.cols.protocol = "ICSP Discovery"

  subtree:add(protocol_field, buffer(0,1))
  subtree:add(length_of_data, buffer(1,2))
  subtree:add(flags, buffer(3,2))

  subtree:add(message_data_system, buffer(7,2))
  -- subtree:add(message_data_port, buffer(9,2))
  -- subtree:add(message_data_system, buffer(11,2))
  -- subtree:add(message_data_device, buffer(11,2))
  -- After 13 two null terminated string
  start_string, string_length, current_index = find_index_of_next_null(buffer, 13)
  subtree:add(message_data_device_model, buffer(start_string, string_length))
  start_string, string_length, current_index = find_index_of_next_null(buffer, current_index)
  subtree:add(message_data_program_info, buffer(start_string, string_length))
  subtree:add(message_data_extended_address_type, buffer(current_index,1))
  current_index = current_index + 1
  subtree:add(message_data_extended_address_length, buffer(current_index,1))
  current_index = current_index + 1
  subtree:add(message_data_ipv4_address, buffer(current_index, 4))
  current_index = current_index + 4
  -- Ok there are 2 bytes here I'm not sure what for ... lets skip them
  subtree:add(skipped_bytes, buffer(current_index, 2))
  current_index = current_index + 2
  subtree:add(message_data_mac_address, buffer(current_index, 6))

end


  local tcp_port = DissectorTable.get("tcp.port")
  tcp_port:add(1319, icsp_protocol)
  tcp_port:add(1320, icsp_protocol)

  -- local udp_port = DissectorTable.get("udp.port")
  -- udp_port:add(1319, icsp_broadcast_protocol)