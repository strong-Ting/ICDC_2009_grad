wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/DICS_LAB/M10912039/CIC/CIC_2009_grad/sim/nfc_nc.fsdb}
wvRestoreSignal -win $_nWave1 \
           "/home/DICS_LAB/M10912039/CIC/CIC_2009_grad/sim/signal.rc" \
           -overWriteAutoAlias on
wvResizeWindow -win $_nWave1 0 23 1536 801
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 2424094.844307 -snap {("G1" 21)}
wvSetCursor -win $_nWave1 2412664.866393 -snap {("G1" 7)}
wvZoomIn -win $_nWave1
wvExit
