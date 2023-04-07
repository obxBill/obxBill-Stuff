<cfoutput>
<h1>Dungeon and Dragons Tool</h1>
<form method='post' action='#event.buildLink('DnD')#'>
Options(s):
    <select name="api" onchange="submit();">   
        <option value="">&nbsp;-- Please Choose --&nbsp;</option>
        <cfloop array="#structkeyArray(prc.stDnDdata)#" index="key">
            <option value="#prc.stDnDdata[key]#" <cfif compare(prc.stDnDdata[key],rc.api) eq 0>selected</cfif> >#Ucase(key)#</option>
        </cfloop>
    </select>

    <select name="api2" onchange="submit();">
        <option value="">&nbsp;-- Please Choose --&nbsp;</option>
        <cfif structKeyExists(prc, 'stDnDresults')>
            <cfloop array="#prc.stDnDresults.results#" index="item">
                    <option value="#item.url#" <cfif compare(item.url,rc.api2) eq 0>selected</cfif> >#item.name#</option>
            </cfloop> 
        </cfif>
    </select>
    </form>
    <cfscript>
        if (structkeyexists(prc,'stDnDresults2')) writedump(prc.stDnDresults2);
    </cfscript>
</cfoutput>