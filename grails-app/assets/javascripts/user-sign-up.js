
'use-strict';

(function() {
    fillSelectClassRooms('select-class');
})();

/**
 * Validates the form for the user sign up.
 */
var validateForm = function() {
    var errorColor = '#D50000';

    var inputs = document.getElementsByTagName('input');
    var inputsSize = inputs.length;

    var dni            = document.getElementById('form-dni');
    var firstName      = document.getElementById('form-first-name');
    var lastName       = document.getElementById('form-last-name');
    var username       = document.getElementById('form-username');
    var email          = document.getElementById('form-email');
    var password       = document.getElementById('form-password');
    var repeatPassword = document.getElementById('form-repeat-password');
    var computer       = document.getElementById('form-computer');

    for (var i = 0; i < inputsSize; i++) {
        inputs[i].style.borderColor = '#EF5350';
    }

    if ( !formDataHelper.validString(email.value) ||
            !formDataHelper.validateEmail(email.value) )
    {
        email.style.borderColor = errorColor;
        return false;
    }
    if ( !formDataHelper.validatePassword(password.value, repeatPassword.value) ) {
        return false;
    }
    if ( !formDataHelper.validString(computer.value) ) {
        return false;
    }

    return true;
};
