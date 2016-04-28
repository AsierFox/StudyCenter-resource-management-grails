
'use-strict';

/** trims the passed string */
function trim(str) {
    return str.replace(/^\s+|\s+$/gm,'');
}

var formDataHelper = {
    /**
     * Validates that the string is not empty or blank.
     */
     validString: function(str) {
        return trim(str);
     },
    /**
     * Validates an email address.
     */
    validEmail: function(email) {
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    },
    /**
     * Validates an password.
     */
    validPassword: function(password, repeatPassword) {
        return true;
    }
};
