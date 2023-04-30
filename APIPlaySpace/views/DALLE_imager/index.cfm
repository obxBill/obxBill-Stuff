
<h1>DALL-e Imager</h1>
<cfoutput>
<form method='post' action='#event.buildLink('DALLE_imager')#'>
Image Generator Prompt:
<div>
    <textarea style="width:400px" name="prompt"></textarea>
    <div><input class="btn btn-dark" type="submit" value="Submit"></div>
    </div>
    </form>
<cfif structkeyexists(prc,"stData")>
<div class="col-lg-6 mx-auto" style="text-align: center;">
    <p>#prc.package.prompt#</p>
    <img src="#prc.stData.data[1].url#" height="600">
</div>
</cfif>
</cfoutput>