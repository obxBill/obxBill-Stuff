<cfoutput>
<div class="container mb-5">
    <div class="row py-5 gx-4">
        <h2 class="text-blue">NASA Image of the Day</h2>
        #cbMessagebox().renderIt()# 
         <div class="container-fluid">
            <div class="row justify-content-md-center">
                <div class="col col-lg-10">
                    <img class="img-fluid img-thumbnail" src="#prc.stNASAdata.hdurl#" height="500">
                </div>
            </div>        
        </div>
    </div>
</div>
</cfoutput>