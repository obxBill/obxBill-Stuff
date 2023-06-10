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

property name="DnDservice" inject="APIService";

	/**
	 * index
	 */

	function index(event, rc, prc) {
		event.paramValue( "api", "");
		event.paramValue( "api2", "");
		var apiURL = 'https://www.dnd5eapi.co/';

		prc.stDnDdata = deserializeJSON(DnDService.getData(apiURL & 'api'));

		if (len(rc.api)) {
			var apiFull1 = apiURL & rc.api;
			prc.stDnDresults = deserializeJSON(DnDService.getData(apiFull1));
		}

		if (len(rc.api2)) {
			var apiFull2 = apiURL & rc.api2;
			prc.stDnDresults2 = deserializeJSON(DnDService.getData(apiFull2));
		}

		event.setView("DnD/index");
	}

}


