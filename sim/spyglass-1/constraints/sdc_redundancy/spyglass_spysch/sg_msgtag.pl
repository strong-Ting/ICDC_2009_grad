################################################################################
#This is an internally genertaed by SpyGlass for Message Tagging Support
################################################################################


use spyglass;
use SpyGlass;
use SpyGlass::Objects;
spyRebootMsgTagSupport();

spySetMsgTagCount(347,54);
spyCacheTagValuesFromBatch(["Block10_TAG"]);
spyCacheTagValuesFromBatch(["pe_crossprobe_tag"]);
spyParseTextMessageTagFile("./spyglass-1/constraints/sdc_redundancy/spyglass_spysch/sg_msgtag.txt");

if(!defined $::spyInIspy || !$::spyInIspy)
{
    spyDefineReportGroupingOrder("ALL",
(
"BUILTIN"   => [SGTAGTRUE, SGTAGFALSE]
,"TEMPLATE" => "A"
)
);
}
spyMessageTagTestBenchmark(1,"./spyglass-1/constraints/sdc_redundancy/spyglass.vdb");

1;
