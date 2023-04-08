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
property name="NASAservice" inject="APIService";
	/**
	 * index
	 */
	function index( event, rc, prc ){
		var apiKey = 'PP2ui1FUsXzQgHC1on4mjZDZZvCm6HOtyVuj1kAH';
		var apiURL = 'https://api.nasa.gov/planetary/apod?api_key=#apiKey#';

		prc.stNASAdata = deserializeJSON(NASAservice.getData(apiURL));

		event.setView( "nasaIOD/index" );
	}



}
