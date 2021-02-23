wvResizeWindow -win $_nWave1 769 31 766 792
wvRestoreSignal -win $_nWave1 \
           "/home/DICS_LAB/M10912039/CIC/CIC_2009_grad/sim/signal.rc" \
           -overWriteAutoAlias on
wvResizeWindow -win $_nWave1 1536 45 1344 777
wvResizeWindow -win $_nWave1 1708 266 900 254
wvSetCursor -win $_nWave1 1777332.072008 -snap {("G1" 6)}
wvResizeWindow -win $_nWave1 0 23 1536 801
wvResizeWindow -win $_nWave1 922 273 900 254
wvResizeWindow -win $_nWave1 769 31 766 792
wvSetCursor -win $_nWave1 3626526.606233 -snap {("G1" 14)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetCursor -win $_nWave1 3621986.157496 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 3602202.773715 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 3624256.381864 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 3609986.400120 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 3625229.335165 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 3614526.848857 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 3626526.606233 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 3610635.035654 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 3624256.381864 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 3605770.269151 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 3620688.886428 -snap {("G1" 7)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test"
wvGetSignalSetScope -win $_nWave1 "/test/f1"
wvGetSignalSetScope -win $_nWave1 "/test/top"
wvSetPosition -win $_nWave1 {("G1" 26)}
wvSetPosition -win $_nWave1 {("G1" 26)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/top/clk} \
{/test/top/rst} \
{/test/top/done} \
{/test/top/cmd\[32:0\]} \
{/test/top/cs\[3:0\]} \
{/test/top/ns\[3:0\]} \
{/test/top/cs_f\[3:0\]} \
{/test/top/ns_f\[3:0\]} \
{/test/top/M_RW} \
{/test/top/M_A\[6:0\]} \
{/test/top/M_D\[7:0\]} \
{/test/top/M_IN\[7:0\]} \
{/test/top/M_OUT\[7:0\]} \
{/test/top/len_counter\[6:0\]} \
{/test/top/CMD_F_ADDR\[17:0\]} \
{/test/top/CMD_LEN\[6:0\]} \
{/test/top/CMD_M_ADDR\[6:0\]} \
{/test/top/CMD_RW} \
{/test/top/F_ALE} \
{/test/top/F_CLE} \
{/test/top/F_EN} \
{/test/top/F_IO\[7:0\]} \
{/test/top/F_RB} \
{/test/top/F_REN} \
{/test/top/F_WEN} \
{/test/top/clk_div} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 26 )} 
wvSetPosition -win $_nWave1 {("G1" 26)}
wvSetPosition -win $_nWave1 {("G1" 26)}
wvSetPosition -win $_nWave1 {("G1" 26)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/top/clk} \
{/test/top/rst} \
{/test/top/done} \
{/test/top/cmd\[32:0\]} \
{/test/top/cs\[3:0\]} \
{/test/top/ns\[3:0\]} \
{/test/top/cs_f\[3:0\]} \
{/test/top/ns_f\[3:0\]} \
{/test/top/M_RW} \
{/test/top/M_A\[6:0\]} \
{/test/top/M_D\[7:0\]} \
{/test/top/M_IN\[7:0\]} \
{/test/top/M_OUT\[7:0\]} \
{/test/top/len_counter\[6:0\]} \
{/test/top/CMD_F_ADDR\[17:0\]} \
{/test/top/CMD_LEN\[6:0\]} \
{/test/top/CMD_M_ADDR\[6:0\]} \
{/test/top/CMD_RW} \
{/test/top/F_ALE} \
{/test/top/F_CLE} \
{/test/top/F_EN} \
{/test/top/F_IO\[7:0\]} \
{/test/top/F_RB} \
{/test/top/F_REN} \
{/test/top/F_WEN} \
{/test/top/clk_div} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 26 )} 
wvSetPosition -win $_nWave1 {("G1" 26)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 25)}
wvSetPosition -win $_nWave1 {("G1" 24)}
wvSetPosition -win $_nWave1 {("G1" 23)}
wvSetPosition -win $_nWave1 {("G1" 22)}
wvSetPosition -win $_nWave1 {("G1" 21)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvResizeWindow -win $_nWave1 792 259 900 254
wvResizeWindow -win $_nWave1 0 23 1536 801
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 4347089.573952 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 4343902.107310 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 708456.691998 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 700806.772058 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 708456.691998 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 704631.732028 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 709731.678655 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 700806.772058 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 703356.745371 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 698575.545409 -snap {("G1" 12)}
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetCursor -win $_nWave1 708456.691998 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 714831.625281 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 716744.105266 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 706544.212013 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 714831.625281 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 709703.552713 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 709703.552713 -snap {("G1" 10)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 703009.872766 -snap {("G1" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSetCursor -win $_nWave1 690188.904873 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 709313.704723 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 706009.251579 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 710471.704877 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 718759.118145 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 702503.038273 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 693578.131676 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 709834.211548 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 698678.078303 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 696765.598318 -snap {("G1" 11)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 4289039.547265 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 4284895.840631 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 4290314.533922 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 4289039.547265 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 4297326.960533 -snap {("G1" 13)}
wvSetCursor -win $_nWave1 4292227.013907 -snap {("G1" 13)}
wvSetCursor -win $_nWave1 4290952.027250 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 4297645.707198 -snap {("G1" 13)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 4341352.133997 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 4347727.067280 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 4344539.600639 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 4349002.053937 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 4343264.613982 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 4348683.307273 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 4339758.400676 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 3706367.580969 -snap {("G1" 15)}
wvSetCursor -win $_nWave1 3686286.541127 -snap {("G1" 15)}
wvSetCursor -win $_nWave1 3706048.834305 -snap {("G1" 15)}
wvSetCursor -win $_nWave1 3663336.781307 -snap {("G1" 23)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 3623174.701624 -snap {("G1" 23)}
wvSetCursor -win $_nWave1 3601499.928461 -snap {("G1" 23)}
wvSetCursor -win $_nWave1 3620624.728310 -snap {("G1" 22)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 2055805.494684 -snap {("G1" 23)}
wvSetCursor -win $_nWave1 2046243.094759 -snap {("G1" 23)}
wvSetCursor -win $_nWave1 2058036.721333 -snap {("G1" 23)}
wvSetCursor -win $_nWave1 2046243.094759 -snap {("G1" 23)}
wvSetCursor -win $_nWave1 2056124.241348 -snap {("G1" 23)}
wvSetCursor -win $_nWave1 2043055.628118 -snap {("G1" 23)}
wvSetCursor -win $_nWave1 2056761.734677 -snap {("G1" 23)}
wvSetCursor -win $_nWave1 2046243.094759 -snap {("G1" 23)}
wvSetCursor -win $_nWave1 2061861.681303 -snap {("G1" 23)}
wvSetCursor -win $_nWave1 2048155.574744 -snap {("G1" 23)}
wvSetCursor -win $_nWave1 2062499.174631 -snap {("G1" 23)}
wvSetCursor -win $_nWave1 2053893.014699 -snap {("G1" 23)}
wvSetCursor -win $_nWave1 2061542.934639 -snap {("G1" 23)}
wvSetCursor -win $_nWave1 2050068.054729 -snap {("G1" 23)}
wvSetCursor -win $_nWave1 2064092.907952 -snap {("G1" 23)}
wvSetCursor -win $_nWave1 2049749.308065 -snap {("G1" 23)}
wvResizeWindow -win $_nWave1 704 152 900 254
wvResizeWindow -win $_nWave1 0 23 1536 801
wvSetCursor -win $_nWave1 2025524.561589 -snap {("G1" 16)}
wvSetCursor -win $_nWave1 2029999.423155 -snap {("G1" 15)}
wvSetCursor -win $_nWave1 2042430.543057 -snap {("G1" 15)}
wvSetCursor -win $_nWave1 2029999.423155 -snap {("G1" 15)}
wvSetCursor -win $_nWave1 2044024.276378 -snap {("G1" 15)}
wvResizeWindow -win $_nWave1 655 226 900 254
wvResizeWindow -win $_nWave1 769 31 766 792
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSetCursor -win $_nWave1 2016396.756757
wvSelectSignal -win $_nWave1 {( "G1" 17 )} 
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 2042561.508841 -snap {("G1" 15)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 2029264.480398 -snap {("G1" 15)}
wvSetCursor -win $_nWave1 2041588.555540 -snap {("G1" 15)}
wvSetCursor -win $_nWave1 2063966.481457 -snap {("G1" 23)}
wvSetCursor -win $_nWave1 2046129.004277 -snap {("G1" 24)}
wvSetCursor -win $_nWave1 2060723.303788 -snap {("G1" 23)}
wvSetCursor -win $_nWave1 2047101.957577 -snap {("G1" 23)}
wvSetCursor -win $_nWave1 2063642.163690 -snap {("G1" 23)}
wvSetCursor -win $_nWave1 2052291.041848 -snap {("G1" 23)}
wvSetCursor -win $_nWave1 2064290.799224 -snap {("G1" 23)}
wvSetCursor -win $_nWave1 2048399.228645 -snap {("G1" 23)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
