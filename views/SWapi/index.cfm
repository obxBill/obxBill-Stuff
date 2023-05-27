<cfoutput>
<div class="container mb-5">
    <div class="row py-5 gx-4">
        <h2 class="text-blue">StarWars Data Tool</h2>
        #cbMessagebox().renderIt()# 
        <form method='post' action='#event.buildLink('SWapi')#'>
            <select class="form-control" name="api" onchange="submit();">   
                <option value="">&nbsp;-- Please Choose --&nbsp;</option>
                <cfloop collection="#prc.stData#" item="item">
                    <option value="#prc.stData[item]#" <cfif prc.stData[item] eq rc.api>selected</cfif> >#ucase(left(item,1))&removeChars(item,1,1)#</option>
                </cfloop>
            </select>
            </form>

<cfscript>
titleCount = 0;
try {
    if (structKeyExists(prc, 'stResults')) {
        for (thisStruct in prc.stResults.results) {

            if (structkeyexists(thisStruct,'title')) {
 
                titleCount = titleCount +1;
                writeoutput('
                <div class="accordion" id="accordionExample">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="heading#titleCount#">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="##collapse#titleCount#" aria-expanded="true" aria-controls="collapse#titleCount#">
                            #thisStruct.title#
                        </button>
                        </h2>
                        <div id="collapse#titleCount#" class="accordion-collapse collapse" aria-labelledby="heading#titleCount#" data-bs-parent="##accordionExample">
                        <div class="accordion-body">
                            #thisStruct.opening_crawl#
                        </div>
                        </div>
                    </div>')

                } else {
                    writeoutput("<div>"&thisStruct.name&"</div>");
                }

            //writedump(thisStruct);
        }
        writedump(prc.stResults)
    }
} catch (any x) {
    writedump(prc)
}   
</cfscript>
</div>
</div>
</cfoutput>
