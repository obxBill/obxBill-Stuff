<cfoutput>
<div class="container mb-5">
    <div class="row py-5 gx-4">
        <h2 class="text-blue">Dungeon and Dragons Tool</h2>
        <form method='post' action='DnD'>
        Options(s):
            <select class="form-control" name="api" onchange="submit();">   
                <option value="">&nbsp;-- Please Choose --&nbsp;</option>
                <cfloop array="#structkeyArray(prc.stDnDdata)#" index="key">
                    <option value="#prc.stDnDdata[key]#" <cfif compare(prc.stDnDdata[key],rc.api) eq 0>selected</cfif> >#Ucase(key)#</option>
                </cfloop>
            </select>

            <select class="form-control" name="api2" onchange="submit();">
                <option value="">&nbsp;-- Please Choose --&nbsp;</option>
                <cfif structKeyExists(prc, 'stDnDresults')>
                    <cfloop array="#prc.stDnDresults.results#" index="item">
                            <option value="#item.url#" <cfif compare(item.url,rc.api2) eq 0>selected</cfif> >#item.name#</option>
                    </cfloop> 
                </cfif>
            </select>
            </form>
            <div class="container-fluid mt-3">
                <cfif structKeyExists(prc, 'stDnDresults2')>
                    <cfif structKeyExists(prc.stDndresults2, 'desc')>
                        <ul class="list-group">
                            <cfif isArray(prc.stDndResults2.desc)>    
                                <cfloop array="#prc.stDnDresults2.desc#" index="item">
                                    <li class="list-group-item list-group-item-info">#item#</li>
                                </cfloop>
                            <cfelse>
                                <li class="list-group-item list-group-item-info">#prc.stDnDresults2.desc#</li>
                            </cfif>                            
                        </ul>
                    <cfelseif structKeyExists(prc.stDndresults2, 'feature')>
                        <ul class="list-group">
                            <cfif isArray(prc.stDndResults2.feature.desc)>    
                                <cfloop array="#prc.stDnDresults2.feature.desc#" index="item">
                                    <li class="list-group-item list-group-item-info">#item#</li>
                                </cfloop>
                            </cfif>                               
                        </ul>
                    <cfelse>
                        <cfdump var="#prc.stDnDresults2#">    
                    </cfif>                     
                </cfif>
            </div>
    </div>
</div>
</cfoutput>