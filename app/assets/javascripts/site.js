window.onpopstate = function( event ) {
    if ( event.state ) {
        $( 'body' ).load( event.state.path );
    };
};

var bodyAjax = (function() {

	var ajaxLink = function( element ) {
		$link = $( element );
		href = $link.attr( 'href' );
		$.get( href ).success( function( result ) {
		switchBody( result );
		});
	};  

	var switchBody = function( result ) {   
		newBody = $.parseHTML( result, document, true );
		oldBody = $( 'body' );
		oldBody.html( newBody );
	};

	return {
		ajaxLink: ajaxLink,
		switchBody: switchBody
	};
})();
