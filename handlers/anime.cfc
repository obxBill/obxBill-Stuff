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

	property name="NAservice" inject="APIService";
	property name='messageBox' inject='@cbmessagebox';
	/**
	 * Display a listing of the resource
	 */
	function index( event, rc, prc ){
		event.paramValue( "api", "");
		arSources = ['husbando','kitsune','neko','waifu'];
		prc.source = arSources[randRange(1,arrayLen(arSources))];

		prc.stData = deserializeJSON(NAservice.getData('https://nekos.best/api/v2/'&prc.source));
		
		for (thisItem in prc.stData.results){
			prc.url = thisItem.url;
			prc.artist = thisItem.artist_name;
		}

		msg = "ARTIST: #prc.artist# ( #prc.source# )";
		messageBox.info( msg);

		event.setView( "anime/index" );
	}
}

