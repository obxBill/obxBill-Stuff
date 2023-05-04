<cfoutput>
<div class="container">
<h1>NASA Image of the Day</h1>
<div>#dateformat(prc.stNASAdata.date,'long')#</div>
<div>#prc.stNASAdata.explanation#</div>
<div><img class="img-fluid" src="#prc.stNASAdata.hdurl#" height="500"></div>
</div>
</cfoutput>