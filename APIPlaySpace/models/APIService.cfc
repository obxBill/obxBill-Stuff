/**
 * I am a new Model Object
 */
component singleton accessors="true"{

	// Properties
	

	/**
	 * Constructor
	 */
	APIService function init(){

		return this;
	}

	/**
	 * getData
	 */
	function getData(required string api, string mtd='get'){

	http url='#arguments.api#' method='#arguments.mtd#' result='apidata';
	return variables.apidata.filecontent;
	}


}

