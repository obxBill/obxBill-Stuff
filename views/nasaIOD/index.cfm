<cfoutput>
<div class="container mb-5">
    <div class="row py-5 gx-4">
        <h2 class="text-blue">NASA Image of the Day</h2>
        #cbMessagebox().renderIt()# 
         <div><img class="img-fluid" src="#prc.stNASAdata.hdurl#" height="500"></div>
    </div>
</div>
</cfoutput>