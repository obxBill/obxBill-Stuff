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
	function getData(required string api, string mtd='get', string package='', string apiKey=''){

		http url=arguments.api method=arguments.mtd result='apidata' timeout=10 {
 			if (len(arguments.apiKey)) httpparam type='header' name='Authorization' value=arguments.apiKey;
			if (len(arguments.package)) {
				httpparam type='body' value=arguments.package; 
				httpparam type='header' name='Content-Type' value='application/json';
 			}
		}
		return variables.apidata.filecontent;
	}


}

