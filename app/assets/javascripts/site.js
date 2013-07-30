window.onpopstate = function( event ) {
    if ( event.state ) {
        $( 'body' ).load( event.state.path );
    };
};
