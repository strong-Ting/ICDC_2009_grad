wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/DICS_LAB/M10912039/CIC/CIC_2009_grad/sim/nfc_nc.fsdb}
wvRestoreSignal -win $_nWave1 \
           "/home/DICS_LAB/M10912039/CIC/CIC_2009_grad/sim/signal.rc" \
           -overWriteAutoAlias on
wvResizeWindow -win $_nWave1 1536 45 1344 777
