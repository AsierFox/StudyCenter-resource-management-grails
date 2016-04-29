
'use-strict';

/** trims the passed string */
function trim(str) {
    return str.replace(/^\s+|\s+$/gm,'');
}

/**
 * Ajax load for the classes at page loaded.
 */
function fillSelectClassRooms(selectId) {
    var req = $.ajax({
        url: "/classroom/getAllClassrooms",
        method: "POST",
        dataType: "json"
    });

    req.done(function(data) {
        var classrooms = data;
        var classroomsSize = data.length;
        var classroomList = '';
        var classroomSelect = $('#' + selectId);

        for (var i = 0; i < classroomsSize; i++) {
            var classroom = classrooms[i];

            classroomSelect
                 .append($("<option></option>")
                    .attr("value", classroom.number)
                    .text('Classroom number ' + classroom.number + ' at Floor ' + classroom.floor));
        }
    });
};

/**
 * Ajax load for the computers of the classrooms.
 */
function showClassroomComputers(classSelect, classroomComputerId) {
    var classroomNumber = classSelect.value;

    var req = $.ajax({
        url: "/classroom/getClassroomComputers/" + classroomNumber,
        method: "POST",
        dataType: "json"
    });

    req.done(function(data) {
        var classroomComputerSelect = $('#' + classroomComputerId);
        var computerSize = data.length;

        // Remove options of select
        classroomComputerSelect
            .find('option')
            .remove()
            .end()
            .append('<option value="whatever">Choose a computer</option>')
            .val('whatever');

        // Check if the classroom have computers
        if ( !computerSize ) {
            classroomComputerSelect
                .append($("<option value=''></option>")
                    .text('There are no computers at this classroom.'));
            return;
        }
        var computerList = '';
        var computers = data;

        for (var i = 0; i < computerSize; i++) {
            var computer = computers[i];

            classroomComputerSelect
                .append($("<option></option>")
                        .attr("value", computer.ipAddress)
                        .text('Computer ' + computer.name));
        }
    });
};

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
