/**
 * I am a new handler
 */
component{

	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};

	/**
	IMPLICIT FUNCTIONS: Uncomment to use

	function preHandler( event, rc, prc, action, eventArguments ){
	}
	function postHandler( event, rc, prc, action, eventArguments ){
	}
	function aroundHandler( event, rc, prc, targetAction, eventArguments ){
		// executed targeted action
		arguments.targetAction( event );
	}
	function onMissingAction( event, rc, prc, missingAction, eventArguments ){
	}
	function onError( event, rc, prc, faultAction, exception, eventArguments ){
	}
	function onInvalidHTTPMethod( event, rc, prc, faultAction, eventArguments ){
	}
	*/
	property name="DALLEservice" inject="APIService";
	property name='messageBox' inject='@cbmessagebox';

	function index( event, rc, prc ) {
			
			event.paramValue( "api", "");
			prc.apikey = 'Bearer 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';
			prc.msg = "";
			if (structkeyexists(rc,'prompt')) {	
				if (len(rc.imgCount) && val(rc.imgCount) <= 5) {
				prc.package = {"prompt": rc.prompt,"n": val(rc.imgCount),"size": "256x256"}
				prc.stData = deserializeJSON(DALLEservice.getData(
					api='https://api.openai.com/v1/images/generations',
					mtd='POST',
					package=serializeJSON(prc.package),
					apiKey=prc.apiKey
				));
				} else {
					prc.msg = "Image count must be at least 1 and less than 5";
				}	
			}
			msg = "Use DALL-e AI Image Generation Tool to create strange and interesting images from creative text prompts!"
			messageBox.info( msg);

			event.setView( "DALLE_imager/index" );
		}
}
