<cfoutput>
<h1>StarWars Data Tool</h1>

<form method='post' action='#event.buildLink('SWapi')#'>
Options(s):
    <select name="api" onchange="submit();">   
        <option value="">&nbsp;-- Please Choose --&nbsp;</option>
        <cfloop collection="#prc.stData#" item="item">
            <option value="#prc.stData[item]#" <cfif prc.stData[item] eq rc.api>selected</cfif> >#ucase(left(item,1))&removeChars(item,1,1)#</option>
        </cfloop>
    </select>
    </form>

<cfscript>
    if (structKeyExists(prc, 'stResults')) {

        for (thisStruct in prc.stResults.results) {
            writeoutput("<div>"&thisStruct.name&"</div>");
            //writedump(thisStruct);
        }
    }
</cfscript>

</cfoutput>
