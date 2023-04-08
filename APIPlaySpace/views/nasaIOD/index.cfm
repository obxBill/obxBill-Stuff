<cfoutput>
<h1>NASA Image of the Day</h1>
<div>#dateformat(prc.stNASAdata.date,'long')#</div>
<div>#prc.stNASAdata.explanation#</div>
<div style="text-align: center;"><img src="#prc.stNASAdata.hdurl#" height="500"></div>
</cfoutput>