<div style="margin:20px;">
    <h1>DALL-e Imager</h1>
    <cfoutput>
    <form method='post' action='#event.buildLink('DALLE_imager')#'>
    Image Generator Prompt:
    <div>
        <div style="color:red;font-weight:bold">#prc.msg#</div>
        <textarea style="width:400px" name="prompt"><cfif structkeyexists(rc,"prompt")>#rc.prompt#</cfif></textarea>
    <div>Image Count: <input type="text" name="imgCount" size="1" value="<cfif structkeyexists(rc,"imgCount")>#rc.imgCount#</cfif>"></div> 
        <div><input class="btn btn-dark" type="submit" value="Submit"></div>
        </div>
        </form>
    <cfif structkeyexists(prc,"stData") and structkeyexists(prc.stData,'data')>
        <div class="col-lg-6 mx-auto" style="text-align: center;">
            <p>#prc.package.prompt#</p>
            <cfloop array="#prc.stData.data#" index="image">
                <a href="#image.url#" target="_blank"><img src="#image.url#" width="200"></a>
            </cfloop>
        </div>
    </cfif>
    </cfoutput>
</div>