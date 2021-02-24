simSetSimulator "-vcssv" -exec "./simv" -args " " -uvmDebug on
debImport "-i" "-simflow" "-dbdir" "./simv.daidir"
verdiWindowResize -win $_Verdi_1 "0" "23" "1536" "801"
srcTBInvokeSim
verdiWindowResize -win $_Verdi_1 "500" "182" "900" "700"
verdiWindowResize -win $_Verdi_1 "0" "23" "1536" "801"
srcTBRunSim
viaLogViewerGoToBlock -logID 1 -next -window "$_InteractiveConsole_2"
viaLogViewerGoToBlock -logID 1 -prev -window "$_InteractiveConsole_2"
verdiDockWidgetSetCurTab -dock windowDock_OneSearch
verdiDockWidgetSetCurTab -dock widgetDock_<Message>
verdiDockWidgetSetCurTab -dock windowDock_OneSearch
verdiDockWidgetSetCurTab -dock windowDock_InteractiveConsole_2
wvCreateWindow
wvRestoreSignal -win $_nWave3 \
           "/home/DICS_LAB/M10912039/CIC/CIC_2009_grad/sim/signal.rc" \
           -overWriteAutoAlias on
wvSetCursor -win $_nWave3 107679.172029 -snap {("G1" 2)}
wvSelectSignal -win $_nWave3 {( "G1" 7 )} 
wvScrollDown -win $_nWave3 5
wvScrollDown -win $_nWave3 3
wvScrollDown -win $_nWave3 5
wvScrollDown -win $_nWave3 3
wvSelectSignal -win $_nWave3 {( "G1" 25 )} 
tfgGenerate -incr -ref "test.top.F_WEN#18000#T" -startWithStmt -schFG
tfgNodeTraceActTrans -win $_tFlowView4 -folder "group_0#T" "test.top.F_WEN" -stopLevel 10
tfgFolderClick  -funcblk -win $_tFlowView4 "test.rst#3000#T"
tfgNodeClick  -win $_tFlowView4 -folder "test.top.cs_f\[3:0\]#3000#T" "test.top.rst"
tfgNodeShowTracePath -win $_tFlowView4 -folder "test.top.cs_f\[3:0\]#3000#T" "test.top.rst"
tfgFolderClick  -funcblk -win $_tFlowView4 "test.top.cs_f\[3:0\]#3000#T"
tfgNodeClick  -win $_tFlowView4 -folder "test.top.F_WEN#3000#T" "test.top.cs_f\[3:0\]"
tfgNodeShowTracePath -win $_tFlowView4 -folder "test.top.F_WEN#3000#T" "test.top.cs_f\[3:0\]"
tfgFolderClick  -funcblk -win $_tFlowView4 "test.top.F_WEN#3000#T"
tfgFolderClick  -funcblk -win $_tFlowView4 "test.top.F_WEN#3000#T"
tfgFolderClick  -funcblk -win $_tFlowView4 "test.top.F_WEN#3000#T"
tfgFolderClick  -funcblk -win $_tFlowView4 "test.top.F_WEN#3000#T"
tfgFolderClick  -funcblk -win $_tFlowView4 "test.top.cs_f\[3:0\]#3000#T"
tfgVHZoomOut -win $_tFlowView4
tfgVHZoomOut -win $_tFlowView4
tfgVHZoomOut -win $_tFlowView4
tfgVHZoomOut -win $_tFlowView4
tfgVHZoomOut -win $_tFlowView4
tfgCloseViewer -win $_tFlowView4
wvSetCursor -win $_nWave3 54557.447162 -snap {("G1" 15)}
wvSelectSignal -win $_nWave3 {( "G1" 15 )} 
wvSetCursor -win $_nWave3 32303.751609 -snap {("G1" 15)}
tfgSetPreference -traceNonTrigX TRUE -trXStopAtBlackBox TRUE -trXVCOnly TRUE -trXShowOnTFV TRUE -trXTraceCauses 2  -trXCauseCNT 1  -trXCycleCNT 0
tfgTrX -noBBox -traceNonTrigX -causeCnt 1 -showOnTFG -time 0 "test.top.CMD_F_ADDR\[17:0\]#T"
tfgFolderClick  -funcblk -win $_tFlowView5 "test.top.CMD_F_ADDR\[17:0\]#0#T"
tfgCloseViewer -win $_tFlowView5
tfgTrXRstClose -win $_tTraceXRst6
verdiDockWidgetSetCurTab -dock widgetDock_<Inst._Tree>
wvSetOptions -win $_nWave3 -autoUpdate on
wvSetOptions -win $_nWave3 -autoUpdate off
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvReloadFile -win $_nWave3
verdiDockWidgetSetCurTab -dock windowDock_InteractiveConsole_2
verdiDockWidgetSetCurTab -dock windowDock_nWave_3
wvSetCursor -win $_nWave3 3110.731636 -snap {("G1" 14)}
verdiDockWidgetSetCurTab -dock windowDock_InteractiveConsole_2
verdiDockWidgetSetCurTab -dock windowDock_nWave_3
wvGoToTime -win $_nWave3 45000
verdiDockWidgetSetCurTab -dock windowDock_InteractiveConsole_2
viaLogViewerShowToolTipDialog -logID 1 -line 30 -window "$_InteractiveConsole_2"
viaLogViewerCloseToolTipDialog -logID 1 -window "$_InteractiveConsole_2"
viaLogViewerCloseToolTipDialog -logID 1 -window "$_InteractiveConsole_2"
verdiDockWidgetSetCurTab -dock windowDock_nWave_3
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
wvScrollDown -win $_nWave3 0
verdiDockWidgetSetCurTab -dock windowDock_InteractiveConsole_2
verdiDockWidgetSetCurTab -dock windowDock_nWave_3
verdiDockWidgetSetCurTab -dock windowDock_InteractiveConsole_2
verdiDockWidgetSetCurTab -dock windowDock_nWave_3
verdiDockWidgetSetCurTab -dock windowDock_InteractiveConsole_2
verdiWindowResize -win $_Verdi_1 "36" "27" "900" "700"
verdiWindowResize -win $_Verdi_1 "1" "31" "766" "792"
