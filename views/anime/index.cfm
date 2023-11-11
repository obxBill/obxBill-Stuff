<cfoutput>
    <div class="container mb-5">
        <div class="row py-5 gx-4">
            <h2 class="text-blue">Nekos Best Anime</h2>
             <div class="container-fluid">
                <div class="row justify-content-md-center">
                    <div class="col col-lg-5">
                        #cbMessagebox().renderIt()# 
                        <cfif structkeyexists(prc,'url')>
                            <img class="img-fluid img-thumbnail" src="#prc.url#">
                        </cfif>
                    </div>
                </div>        
            </div>
        </div>
    </div>
</cfoutput>
