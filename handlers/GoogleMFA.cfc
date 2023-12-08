/**
 * I am a new handler
 * Implicit Functions: preHandler, postHandler, aroundHandler, onMissingAction, onError, onInvalidHTTPMethod
 */
component extends="coldbox.system.EventHandler"{

	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	this.allowedMethods = {};

	/**
	 * Display a listing of the resource
	 */
	function index( event, rc, prc ){

		// Sample usage
		prc.accountName = "user@example.com"; // Replace with the user's account name
		prc.secretKey = generateSecretKey('AES');
		prc.qrCodeURL = generateQRCodeURL(prc.accountName, prc.secretKey);

		//Example of generating and verifying a TOTP
		//var userProvidedCode = "123456"; // Replace with the code provided by the user
		//prc.generatedCode = generateTOTP(prc.secretKey);

	}

// Function to generate the QR code URL
function generateQRCodeURL(accountName, secretKey) {
    var base32Secret = URLEncodedFormat(secretKey);
    var issuer = "GoogleMFA"; // Change this to your application name

    var uri = "otpauth://totp/#URLEncodedFormat(issuer)#:#URLEncodedFormat(accountName)#?secret=#base32Secret#&issuer=#URLEncodedFormat(issuer)#";
    return uri;
}

// Function to generate a TOTP based on the secret key
function generateTOTP(secretKey) {
    // Set the time step (default is 30 seconds)
    var timeStep = 30;

    // Get the current time in seconds
    var currentTime = now().getTime() / 1000;

    // Calculate the number of time steps
    var timeStepCount = fix(currentTime / timeStep);

    // Convert the secret key to a Base64 byte array
    var secretBytes = binaryDecode(secretKey, "base64");

    // Convert the time step count to an 8-byte array
    var timeBytes = binaryEncode(toBinary(timeStepCount), "base64");

    // Pad the time bytes with zeros to make it 8 bytes
    timeBytes = repeatString("=", 8 - len(timeBytes)) & timeBytes;

    // Create an HMAC-SHA-1 hash of the time bytes using the secret key
    var hmacBytes = hmac(timeBytes, secretBytes,"HmacSHA1");

    // Get the last 4 bits of the hash to use as the offset
    var offset = bitAnd(right(hmacBytes,4), 15) + 1;

    // Get 4 bytes from the hash starting at the offset
    var codeBytes = hmacBytes[offset + 1] & 127;
    // codeBytes = bitShiftLeft(codeBytes, 8) | (hmacBytes[offset + 2] & 255);
    // codeBytes = bitShiftLeft(codeBytes, 8) | (hmacBytes[offset + 3] & 255);
    // codeBytes = bitShiftLeft(codeBytes, 8) | (hmacBytes[offset + 4] & 255);

    // Take the last 6 digits of the code
    var totpCode = codeBytes % 1000000;

    // Pad the code with zeros to make it 6 digits
    return numberFormat(totpCode, "000000");
}


}

