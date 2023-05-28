<div class="container mb-5">
    <div class="row py-5 gx-4">
        <h2 class="text-blue">DALL-e Imaginer</h2>
        <cfoutput>
        #cbMessagebox().renderIt()# 
        <p class="text-warning">#prc.msg#</p>

        <form method='post' action='#event.buildLink('DALLE_imager')#'>
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-floating">
                            <textarea class="form-control" id="prompt" name="prompt"><cfif structkeyexists(rc,"prompt")>#rc.prompt#</cfif></textarea>  
                            <label for="prompt">Image Generator Prompt</label>
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-sm-2">
                        <div class="form-group d-flex">  
                            <label for="imgCount" class="col-form-label">Image Count:</label>    
                            <input class="form-control" style="width:3em;" type="text" id="imgCount" name="imgCount" value="<cfif structkeyexists(rc,"imgCount")>#rc.imgCount#</cfif>">
                        </div>
                    </div>    
                    <div class="col-sm-10">
                            <button type="submit" class="btn btn-primary">Submit</button>
                    </div>   
                </div>  
            </div>    
        </form>

            <cfif structkeyexists(prc,"stData") >
                <div class="container mt-3" style="width:60%">
                        <cfif structkeyexists(prc.stData,"error")>
                            <p class="text-warning">#prc.stData.error.message#</p>
                        <cfelse>
                            <p class="cbox_messagebox cbox_messagebox_info text-center">#prc.package.prompt#</p>

                            <cfloop array="#prc.stData.data#" item="image" index="cindex">
                                <a href="##" data-bs-toggle="modal" data-bs-target="##exampleModal#cindex#"><img src="#image.url#" width="200" class="img-thumbnail"></a>
                            
                                <div class="modal fade" id="exampleModal#cindex#" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                    <div class="modal-body">
                                        <img src="#image.url#" width="500" height="200" class="img-thumbnail">
                                        <a href="##" data-bs-target="##exampleModal<cfif cindex eq 1>#arrayLen(prc.stData.data)#<cfelse>#cindex-1#</cfif>" data-bs-toggle="modal"><i class="bi bi-caret-left-square" data-bs-toggle="tooltip" data-bs-placement="bottom" title="prior image"></i></a>
                                        <a href="##" data-bs-target="##exampleModal<cfif cindex eq arrayLen(prc.stData.data)>1<cfelse>#cindex+1#</cfif>" data-bs-toggle="modal"><i class="bi bi-caret-right-square" title="next image"></i></a>
                                        <a href="##" class="float-end" data-bs-dismiss="modal"><i class="bi bi-caret-down-square" title="close"></i></a>
                                    </div>
                                    </div>
                                </div>
                                </div>                        
                            </cfloop>
                        </cfif>
                    </div>
            </cfif>
        </cfoutput>
    </div>
</div>


<cfinclude template="test.html">