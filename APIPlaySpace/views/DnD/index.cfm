<cfoutput>
<h1>Dungeon and Dragons Tool</h1>
<form method='post' action='#event.buildLink('DnD')#'>
Options(s):
    <select name="api" onchange="submit();">   
        <option value="">&nbsp;-- Please Choose --&nbsp;</option>
        <cfloop collection="#prc.stDnDdata#" item="item">
            <option value="#prc.stDnDdata[item]#" <cfif prc.stDnDdata[item] eq rc.api>selected</cfif>>#ucase(left(item,1))&removeChars(item,1,1)#</option>
        </cfloop>
    </select>

    <select name="api2" onchange="submit();">
        <option value="">&nbsp;-- Please Choose --&nbsp;</option>
        <cfif structKeyExists(prc, 'stDnDresults')>
        <cfloop collection="#prc.stDnDresults#" item="item">
            <!---<option value="#prc.stDnDresults[item]#" <cfif prc.stDnDresults[item] eq rc.api>selected</cfif>>#ucase(left(item,1))&removeChars(item,1,1)#</option>
       ---> </cfloop>    
        </cfif>
    </select>
    </form>
    <cfif structKeyExists(prc, 'stDnDresults')>
     <cfloop collection="#prc.stDnDresults#" item="item">
     
        #writedump(prc.stDnDresults[item])#
   
     </cfloop>
    </cfif>
</cfoutput>