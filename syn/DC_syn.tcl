#Read All Files
read_verilog ../src/NFC.v
current_design NFC
link

#Setting Clock Constraints
source -echo -verbose NFC.sdc

#Synthesis all design
compile -map_effort high -area_effort high
compile -map_effort high -area_effort high -inc

write -format ddc     -hierarchy -output "NFC_syn.ddc"
write_sdf NFC_syn.sdf
write_file -format verilog -hierarchy -output NFC_syn.v
report_area > area.log
report_timing > timing.log
report_qor   >  NFC_syn.qor
