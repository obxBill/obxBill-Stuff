/**
 * I am a new Model Object
 */
component singleton accessors="true"{

	// Properties
	

	/**
	 * Constructor
	 */
	GreeterService function init(){

		return this;
	}

	/**
	 * sayHello
	 */
	function sayHello(msg){
		return msg;
	}


}