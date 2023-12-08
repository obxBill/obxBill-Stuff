<cfscript>

// Output QR Code URL for the user to scan
//writeOutput("<img src='https://chart.googleapis.com/chart?chs=200x200&chld=M|0&cht=qr&chl=#URLEncodedFormat(prc.qrCodeURL)#' alt='QR Code'><br>");



// if (prc.userProvidedCode == prc.generatedCode) {
//     writeOutput("Authentication successful!");
// } else {
//     writeOutput("Authentication failed. Please try again.");
// }
</cfscript>    


<cfoutput>
    <div class="container mb-5">
        <div class="row py-5 gx-4">
            <h2 class="text-blue">Scan the following QR Code using Google Authenticator or a compatible app:</h2>
             <div class="container-fluid">
                <div class="row justify-content-md-center">
                    <div class="col col-lg-5">
                        <img src='https://chart.googleapis.com/chart?chs=200x200&chld=M|0&cht=qr&chl=#URLEncodedFormat(prc.qrCodeURL)#' alt='QR Code'>
                        <cfdump var="#prc#">
                    </div>
                </div>        
            </div>
        </div>
    </div>
</cfoutput>