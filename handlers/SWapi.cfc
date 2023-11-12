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

	this.APIurl = 'https://swapi.dev/api/';

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
	property name="SWservice" inject="APIService";
	property name='messageBox' inject='@cbmessagebox';

	function index( event, rc, prc ) {
			
			event.paramValue( "api", "");
			msg = "Choose from various categories to view Star Wars data"
			messageBox.info( msg);
			prc.stData = deserializeJSON(SWservice.getData(this.APIurl));
			
			if (len(rc.api)) {
				prc.stResults = deserializeJSON(SWservice.getData(rc.api));
			} 

			prc.arOmit = ['created','edited','url'];

			event.setView( "SWapi/index" );
		}
		
	function person( person ) {

		prc.data = deserializeJSON(SWservice.getData(person));

		return prc.data;

	}

	function planet( homeworld ) {

		prc.data = deserializeJSON(SWservice.getData(homeworld));
		return prc.data;

	}	


}