debImport "-f" "run.f"
debLoadSimResult /home/DICS_LAB/M10912039/CIC/CIC_2009_grad/sim/nfc_nc.fsdb
wvCreateWindow
wvRestoreSignal -win $_nWave2 \
           "/home/DICS_LAB/M10912039/CIC/CIC_2009_grad/sim/signal.rc" \
           -overWriteAutoAlias on
verdiWindowResize -win $_Verdi_1 "0" "23" "1536" "801"
schCreateWindow -hierFSM -win $_nSchema1 -mode all
verdiWindowResize -win $_Verdi_1 "500" "182" "900" "700"
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 139 249 305 308
wvResizeWindow -win $_nWave2 0 23 1536 801
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
schCreateWindow -hierFSM -win $_nSchema1 -mode all
debReload
wvSetCursor -win $_nWave2 65344.472453 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 73566.624616 -snap {("G1" 6)}
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 75960.674847 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 67409.754601 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 72540.306748 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 2309531.540586 -snap {("G1" 4)}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 77528.343558 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 90497.239264 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 89214.601227 -snap {("G1" 4)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 75818.159509 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 76103.190184 -snap {("G1" 3)}
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 97334501.358738 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 97325380.377143 -snap {("G1" 6)}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 95200.245399 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 93205.030675 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 106601.472393 -snap {("G1" 3)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/test/top"
wvGetSignalSetSignalFilter -win $_nWave2 "cmd*"
wvGetSignalOpen -win $_nWave2
wvGetSignalSetSignalFilter -win $_nWave2 "cmd*"
wvGetSignalOpen -win $_nWave2
wvGetSignalNavigateScope -win $_nWave2 -prev "/test/top"
wvGetSignalNavigateScope -win $_nWave2 -next "/test/top"
wvGetSignalNavigateScope -win $_nWave2 -next "/test/top"
wvGetSignalNavigateScope -win $_nWave2 -next "/test/top"
wvGetSignalNavigateScope -win $_nWave2 -next "/test/top"
wvGetSignalNavigateScope -win $_nWave2 -next "/test/top"
wvGetSignalNavigateScope -win $_nWave2 -prev "/test/top"
wvGetSignalSetSignalFilter -win $_nWave2 "cmd*"
wvGetSignalOpen -win $_nWave2
wvGetSignalSetSignalFilter -win $_nWave2 "cmd_reg"
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/test/top/clk} \
{/test/top/rst} \
{/test/top/done} \
{/test/top/cmd\[32:0\]} \
{/test/top/ns\[3:0\]} \
{/test/top/ns_f\[3:0\]} \
{/test/top/M_RW} \
{/test/top/M_A\[6:0\]} \
{/test/top/M_D\[7:0\]} \
{/test/top/CMD_F_ADDR\[17:0\]} \
{/test/top/CMD_LEN\[6:0\]} \
{/test/top/CMD_M_ADDR\[6:0\]} \
{/test/top/F_ALE} \
{/test/top/F_CLE} \
{/test/top/F_IO\[7:0\]} \
{/test/top/F_RB} \
{/test/top/F_REN} \
{/test/top/F_WEN} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/test/top/cmd_reg\[6:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/test/top/clk} \
{/test/top/rst} \
{/test/top/done} \
{/test/top/cmd\[32:0\]} \
{/test/top/ns\[3:0\]} \
{/test/top/ns_f\[3:0\]} \
{/test/top/M_RW} \
{/test/top/M_A\[6:0\]} \
{/test/top/M_D\[7:0\]} \
{/test/top/CMD_F_ADDR\[17:0\]} \
{/test/top/CMD_LEN\[6:0\]} \
{/test/top/CMD_M_ADDR\[6:0\]} \
{/test/top/F_ALE} \
{/test/top/F_CLE} \
{/test/top/F_IO\[7:0\]} \
{/test/top/F_RB} \
{/test/top/F_REN} \
{/test/top/F_WEN} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/test/top/cmd_reg\[6:0\]} \
{/test/top/CMD_F_ADDR_now_flash\[8:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/test/top/clk} \
{/test/top/rst} \
{/test/top/done} \
{/test/top/cmd\[32:0\]} \
{/test/top/ns\[3:0\]} \
{/test/top/ns_f\[3:0\]} \
{/test/top/M_RW} \
{/test/top/M_A\[6:0\]} \
{/test/top/M_D\[7:0\]} \
{/test/top/CMD_F_ADDR\[17:0\]} \
{/test/top/CMD_LEN\[6:0\]} \
{/test/top/CMD_M_ADDR\[6:0\]} \
{/test/top/F_ALE} \
{/test/top/F_CLE} \
{/test/top/F_IO\[7:0\]} \
{/test/top/F_RB} \
{/test/top/F_REN} \
{/test/top/F_WEN} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/test/top/cmd_reg\[6:0\]} \
{/test/top/CMD_F_ADDR_now_flash\[8:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSetPosition -win $_nWave2 {("G3" 2)}
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 90069.693252 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 95770.306748 -snap {("G1" 1)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 152206.380368 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 158192.024540 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 169878.282209 -snap {("G1" 1)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
debReload
schCreateWindow -hierFSM -win $_nSchema1 -mode all
wvSetCursor -win $_nWave2 98620.613497 -snap {("G1" 12)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomIn -win $_nWave2
wvResizeWindow -win $_nWave2 0 23 1536 801
wvResizeWindow -win $_nWave2 0 23 1536 801
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/test/top"
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/test/top/clk} \
{/test/top/rst} \
{/test/top/done} \
{/test/top/cmd\[32:0\]} \
{/test/top/ns\[3:0\]} \
{/test/top/ns_f\[3:0\]} \
{/test/top/M_RW} \
{/test/top/M_A\[6:0\]} \
{/test/top/M_D\[7:0\]} \
{/test/top/CMD_F_ADDR\[17:0\]} \
{/test/top/CMD_LEN\[6:0\]} \
{/test/top/CMD_M_ADDR\[6:0\]} \
{/test/top/F_ALE} \
{/test/top/F_CLE} \
{/test/top/F_IO\[7:0\]} \
{/test/top/F_RB} \
{/test/top/F_REN} \
{/test/top/F_WEN} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/test/top/cmd_reg\[6:0\]} \
{/test/top/CMD_F_ADDR_now_flash\[8:0\]} \
{/test/top/cs\[3:0\]} \
{/test/top/cs_f\[3:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G3" 3 4 )} 
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/test/top/clk} \
{/test/top/rst} \
{/test/top/done} \
{/test/top/cmd\[32:0\]} \
{/test/top/ns\[3:0\]} \
{/test/top/ns_f\[3:0\]} \
{/test/top/M_RW} \
{/test/top/M_A\[6:0\]} \
{/test/top/M_D\[7:0\]} \
{/test/top/CMD_F_ADDR\[17:0\]} \
{/test/top/CMD_LEN\[6:0\]} \
{/test/top/CMD_M_ADDR\[6:0\]} \
{/test/top/F_ALE} \
{/test/top/F_CLE} \
{/test/top/F_IO\[7:0\]} \
{/test/top/F_RB} \
{/test/top/F_REN} \
{/test/top/F_WEN} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/test/top/cmd_reg\[6:0\]} \
{/test/top/CMD_F_ADDR_now_flash\[8:0\]} \
{/test/top/cs\[3:0\]} \
{/test/top/cs_f\[3:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G3" 3 4 )} 
wvSetPosition -win $_nWave2 {("G3" 4)}
wvGetSignalClose -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSetCursor -win $_nWave2 86049.174825 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 90900.000000 -snap {("G1" 5)}
wvResizeWindow -win $_nWave2 1052 85 305 308
wvResizeWindow -win $_nWave2 0 23 1536 801
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/test"
wvGetSignalSetScope -win $_nWave2 "/test/top"
wvGetSignalSetScope -win $_nWave2 "/test/top"
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/test/top/clk} \
{/test/top/rst} \
{/test/top/done} \
{/test/top/cmd\[32:0\]} \
{/test/top/cs\[3:0\]} \
{/test/top/ns\[3:0\]} \
{/test/top/cs_f\[3:0\]} \
{/test/top/cmd_reg\[32:0\]} \
{/test/top/ns_f\[3:0\]} \
{/test/top/M_RW} \
{/test/top/M_A\[6:0\]} \
{/test/top/M_D\[7:0\]} \
{/test/top/CMD_F_ADDR\[17:0\]} \
{/test/top/CMD_LEN\[6:0\]} \
{/test/top/CMD_M_ADDR\[6:0\]} \
{/test/top/F_ALE} \
{/test/top/F_CLE} \
{/test/top/F_IO\[7:0\]} \
{/test/top/F_RB} \
{/test/top/F_REN} \
{/test/top/F_WEN} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/test/top/cmd_reg\[6:0\]} \
{/test/top/CMD_F_ADDR_now_flash\[8:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSetPosition -win $_nWave2 {("G1" 8)}
wvGetSignalClose -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSetCursor -win $_nWave2 147474.836120 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 144359.170569 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 145397.725753 -snap {("G1" 1)}
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 134233.257525 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 146436.280936 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 145917.003344 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 145397.725753 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 146436.280936 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 156951.652174 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 144800.556522 -snap {("G1" 1)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 136102.656856 -snap {("G1" 8)}
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSetCursor -win $_nWave2 125197.827425 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 136232.476254 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 135064.101672 -snap {("G1" 1)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/test/top"
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/test/top/clk} \
{/test/top/rst} \
{/test/top/done} \
{/test/top/cmd\[32:0\]} \
{/test/top/ns\[3:0\]} \
{/test/top/CNT_M\[6:0\]} \
{/test/top/ns_f\[3:0\]} \
{/test/top/M_RW} \
{/test/top/M_A\[6:0\]} \
{/test/top/M_D\[7:0\]} \
{/test/top/CMD_F_ADDR\[17:0\]} \
{/test/top/CMD_LEN\[6:0\]} \
{/test/top/CMD_M_ADDR\[6:0\]} \
{/test/top/F_ALE} \
{/test/top/F_CLE} \
{/test/top/F_IO\[7:0\]} \
{/test/top/F_RB} \
{/test/top/F_REN} \
{/test/top/F_WEN} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/test/top/cmd_reg\[6:0\]} \
{/test/top/CMD_F_ADDR_now_flash\[8:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSetPosition -win $_nWave2 {("G1" 6)}
wvGetSignalClose -win $_nWave2
wvSetCursor -win $_nWave2 125068.008027 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 134804.462876 -snap {("G1" 1)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 127404.757191 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 135064.101672 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 126236.382609 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 134934.282274 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 127664.395987 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 136492.115050 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 126106.563211 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 131948.436120 -snap {("G1" 9)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/test/top"
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/test/top"
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/test/top/clk} \
{/test/top/rst} \
{/test/top/done} \
{/test/top/cmd\[32:0\]} \
{/test/top/ns\[3:0\]} \
{/test/top/CNT_M\[6:0\]} \
{/test/top/blcok_address\[11:0\]} \
{/test/top/ns_f\[3:0\]} \
{/test/top/M_RW} \
{/test/top/M_A\[6:0\]} \
{/test/top/M_D\[7:0\]} \
{/test/top/CMD_F_ADDR\[17:0\]} \
{/test/top/CMD_LEN\[6:0\]} \
{/test/top/CMD_M_ADDR\[6:0\]} \
{/test/top/F_ALE} \
{/test/top/F_CLE} \
{/test/top/F_IO\[7:0\]} \
{/test/top/F_RB} \
{/test/top/F_REN} \
{/test/top/F_WEN} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/test/top/cmd_reg\[6:0\]} \
{/test/top/CMD_F_ADDR_now_flash\[8:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSetPosition -win $_nWave2 {("G1" 7)}
wvGetSignalClose -win $_nWave2
wvSetCursor -win $_nWave2 135193.921070 -snap {("G1" 1)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 125327.646823 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 135583.379264 -snap {("G1" 1)}
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 136102.656856 -snap {("G1" 11)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 134999.191973 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 136037.747157 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 135064.101672 -snap {("G1" 1)}
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvSetCursor -win $_nWave2 135972.837458 -snap {("G1" 10)}
wvSetCursor -win $_nWave2 135843.018060 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 135713.198662 -snap {("G1" 11)}
wvSelectSignal -win $_nWave2 {( "G1" 11 )} 
wvSetCursor -win $_nWave2 145968.931104 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 135583.379264 -snap {("G1" 11)}
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 11 )} 
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSetCursor -win $_nWave2 136621.934448 -snap {("G1" 10)}
wvSetCursor -win $_nWave2 135129.011371 -snap {("G1" 1)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 11 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/test/top"
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/test/top/clk} \
{/test/top/rst} \
{/test/top/done} \
{/test/top/cmd\[32:0\]} \
{/test/top/ns\[3:0\]} \
{/test/top/CNT_M\[6:0\]} \
{/test/top/blcok_address\[11:0\]} \
{/test/top/M_IN_delay\[7:0\]} \
{/test/top/ns_f\[3:0\]} \
{/test/top/M_RW} \
{/test/top/M_A\[6:0\]} \
{/test/top/M_D\[7:0\]} \
{/test/top/CMD_F_ADDR\[17:0\]} \
{/test/top/CMD_LEN\[6:0\]} \
{/test/top/CMD_M_ADDR\[6:0\]} \
{/test/top/F_ALE} \
{/test/top/F_CLE} \
{/test/top/F_IO\[7:0\]} \
{/test/top/F_RB} \
{/test/top/F_REN} \
{/test/top/F_WEN} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/test/top/cmd_reg\[6:0\]} \
{/test/top/CMD_F_ADDR_now_flash\[8:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/test/top/clk} \
{/test/top/rst} \
{/test/top/done} \
{/test/top/cmd\[32:0\]} \
{/test/top/ns\[3:0\]} \
{/test/top/CNT_M\[6:0\]} \
{/test/top/blcok_address\[11:0\]} \
{/test/top/M_IN_delay\[7:0\]} \
{/test/top/ns_f\[3:0\]} \
{/test/top/M_RW} \
{/test/top/M_A\[6:0\]} \
{/test/top/M_D\[7:0\]} \
{/test/top/CMD_F_ADDR\[17:0\]} \
{/test/top/CMD_LEN\[6:0\]} \
{/test/top/CMD_M_ADDR\[6:0\]} \
{/test/top/F_ALE} \
{/test/top/F_CLE} \
{/test/top/F_IO\[7:0\]} \
{/test/top/F_RB} \
{/test/top/F_REN} \
{/test/top/F_WEN} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/test/top/cmd_reg\[6:0\]} \
{/test/top/CMD_F_ADDR_now_flash\[8:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSetPosition -win $_nWave2 {("G1" 8)}
wvGetSignalClose -win $_nWave2
wvSetCursor -win $_nWave2 137335.941137 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 135064.101672 -snap {("G1" 1)}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSetCursor -win $_nWave2 150720.321070 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 162014.608696 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 176554.381271 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 163053.163880 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 175256.187291 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 164610.996656 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 174477.270903 -snap {("G1" 9)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 151758.876254 -snap {("G1" 6)}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSetCursor -win $_nWave2 162144.428094 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 149811.585284 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 150460.682274 -snap {("G1" 6)}
wvSetWindowTimeUnit -win $_nWave2 1.000000 ns
wvSetCursor -win $_nWave2 149.551946 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 162.014609 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 162.923344 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 174.217632 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 174.607090 -snap {("G1" 6)}
