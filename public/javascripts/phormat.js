$.fn.authLinks = function() {
    if (this.is('a')) {
        this.click(authorize);
    }
    var authWindow = jQuery('#auth').prop('contentWindow');
    function authorized(e) {
        if (e && e.data) {
            authWindow[e.data]();
        }
    }
    function authorize(e) {
        e.preventDefault();
        e.stopPropagation();
        if (authWindow) {
            jQuery(authWindow)
                .off('message', authorized)
                .on('message', authorized)
                .attr('src', e.target.href);
        }
    }
};

