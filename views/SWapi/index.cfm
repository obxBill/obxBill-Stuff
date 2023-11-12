<cfoutput>
<div class="container mb-5">
    <div class="row py-5 gx-4">
        <h2 class="text-blue">StarWars Data Tool</h2>
        #cbMessagebox().renderIt()# 
        <form method='post' action='SWapi'>
            <select class="form-control" name="api" onchange="submit();">   
                <option value="">&nbsp;-- Please Choose --&nbsp;</option>
                <cfloop collection="#prc.stData#" item="item">
                    <option value="#prc.stData[item]#" <cfif prc.stData[item] eq rc.api>selected</cfif> >#ucase(left(item,1))&removeChars(item,1,1)#</option>
                </cfloop>
            </select>
        </form>

<div class="container-fluid p-3">
<cfscript>
titleCount = 0;
//try {
    if (structKeyExists(prc, 'stResults')) {
        counter = 0;
        for (thisStruct in prc.stResults.results) {
            counter=counter+1;

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
                            <p>
                                <div><strong>Director:</strong>  #thisStruct.director#</div>
                                <div><strong>Release Date:</strong>  #Dateformat(thisStruct.release_date,'long')#</div>
                            </p>
                        </div>
                        </div>
                    </div>')

             } else {
                if (counter mod 2 eq 0) {
                    writeOutput('<div class="rounded-2 p-3 mb-3 bg-light border border-dark">');
                } else {
                    writeOutput('<div class="rounded-2 p-3 mb-3 bg-dark border border-dark">');
                }    
                
                    for (thisElement in thisStruct){
                        if (structKeyexists(thisStruct,thisElement) && isSimpleValue(thisStruct[thisElement]) && !arrayContainsNoCase(prc.arOmit,thisElement)) {
                           writeoutput("<div><strong>#ucase(thisElement)#:</strong> #thisStruct[thisElement]#</div>");
                       } 
                    }
                writeOutput("</div>");    
            }
        }
    }
    
/*} catch (any x) {
    writedump(prc)
} */  
</cfscript>
</div>
</div>
</div>
</cfoutput>
