cmd /c " --config "C:/Program Files (x86)/IAR Systems/Embedded Workbench 7.0/arm/config/linker/NXP/LPC1788.icf" --no_wrap_diagnostics --semihosting  && ielftool --checksum __vector_table+0x1c:4,sum32:2;__vector_table-__vector_table+0x1B --verbose  "