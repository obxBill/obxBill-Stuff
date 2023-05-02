<div class="container-fluid">
    <h1>DALL-e Imager</h1>
    <cfoutput>
    <p class="text-warning">#prc.msg#</p>

    <form method='post' action='#event.buildLink('DALLE_imager')#'>
        <div class="row mb-3">
            <label for="prompt" class="col-sm-2 col-form-label">Image Generator Prompt:</label>
            <div class="col-sm-10">
            <textarea class="form-control" id="prompt" name="prompt"><cfif structkeyexists(rc,"prompt")>#rc.prompt#</cfif></textarea>  
            </div>
         </div>
         <div class="row mb-3">  
            <label for="imgCount" class="col-sm-2 col-form-label">Image Count:</label> 
            <div class="col-sm-10">
            <input class="form-control" style="width:3em;" type="text" id="imgCount" name="imgCount" value="<cfif structkeyexists(rc,"imgCount")>#rc.imgCount#</cfif>">
            </div>
         </div>   
        <div class="row mb-3">
            <div class="col-sm-10 offset-sm-2">
                 <button type="submit" class="btn btn-dark">Submit</button>
            </div>
        </div>       
     </form>

        <cfif structkeyexists(prc,"stData") >
            <figure class="text-center">
                    <cfif structkeyexists(prc.stData,"error")>
                        <p class="text-warning">#prc.stData.error.message#</p>
                    <cfelse>
                        <p>#prc.package.prompt#</p>
                        <cfloop array="#prc.stData.data#" index="image">
                            <a href="#image.url#" target="_blank"><img src="#image.url#" width="200" class="img-thumbnail"></a>
                        </cfloop>
                    </cfif>
                </figure>
        </cfif>
    </cfoutput>
</div>