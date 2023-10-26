<cfoutput>
<div class="container mb-5">
    <div class="row py-5 gx-4">
        <h2 class="text-blue">NASA Image of the Day</h2>
        #cbMessagebox().renderIt()# 
         <div class="container-fluid">
            <div class="row justify-content-md-center">
                <div class="col col-lg-10">
                    <cfif structkeyexists(prc,'stNASAdata')>
                        <cfif structKeyExists(prc.stNASAdata,'url')>
                            <iframe src="#prc.stNASAdata.url#" width="100%" height="500"></iframe>
                        <cfelseif structKeyExists(prc.stNASAdata,'hdurl')>
                            <img class="img-fluid img-thumbnail" src="#prc.stNASAdata.hdurl#" height="500"> 
                        <cfelse>
                            <cfdump var="#prc.stNASAdata#"> 
                        </cfif>
                    </cfif>
                </div>
            </div>        
        </div>
    </div>
</div>
</cfoutput>