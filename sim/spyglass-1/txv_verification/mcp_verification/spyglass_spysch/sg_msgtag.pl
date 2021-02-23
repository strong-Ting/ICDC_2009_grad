################################################################################
#This is an internally genertaed by SpyGlass for Message Tagging Support
################################################################################


use spyglass;
use SpyGlass;
use SpyGlass::Objects;
spyRebootMsgTagSupport();

spySetMsgTagCount(347,54);
spyCacheTagValuesFromBatch(["Block10_TAG"]);
spyCacheTagValuesFromBatch(["GEN33_TAG"]);
spyCacheTagValuesFromBatch(["MCP05_TAG"]);
spyCacheTagValuesFromBatch(["SkippedCP_TAG"]);
spyCacheTagValuesFromBatch(["TxvMcpUninitTag"]);
spyCacheTagValuesFromBatch(["TxvReportCP_TAG"]);
spyCacheTagValuesFromBatch(["TxvReportMCPDetail_TAG"]);
spyCacheTagValuesFromBatch(["TxvReportMCPSummary_TAG"]);
spyCacheTagValuesFromBatch(["pe_crossprobe_tag"]);
spyParseTextMessageTagFile("./spyglass-1/txv_verification/mcp_verification/spyglass_spysch/sg_msgtag.txt");

if(!defined $::spyInIspy || !$::spyInIspy)
{
    spyDefineReportGroupingOrder("ALL",
(
"BUILTIN"   => [SGTAGTRUE, SGTAGFALSE]
,"TEMPLATE" => "A"
)
);
}
spyMessageTagTestBenchmark(1,"./spyglass-1/txv_verification/mcp_verification/spyglass.vdb");

1;
