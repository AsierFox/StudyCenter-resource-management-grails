
/**
 * Gets all the File System and Operating System types.
 */
function fillSelectOSFS(selectId, type) {
    var url = '/computer/';
    url += ( type == 'os' ) ? 'getAllOperatingSystems' : 'getAllFileSystems';

    $.ajax({
        url: url,
        method: "POST",
        dataType: "json",
        success: function(data) {
            var select = $('#' + selectId);
            var size = data.length;

            for (var i = 0; i < size; i++) {
                var e = data[i];

                select
                    .append($("<option></option>")
                        .attr("value", e.id)
                        .text(e.name));
            }
        }
    });
};

/**
 * Create the computer function.
 */
function createComputer() {
    var modal = $('#createComputerModal');

    fillSelectClassRooms('select-class');
    fillSelectOSFS('select-os', 'os');
    fillSelectOSFS('select-fs', 'fs');

    modal.modal('show');
};

/**
 * Create the new computer.
 */
function createNewComputer(url) {
    var classroomNumber = document.getElementById('select-class').value;
    var computerName = document.getElementById('computer-name').value;
    var computerIPAddress = document.getElementById('computer-ip-address').value;
    var computerOS = document.getElementById('select-os').value;
    var computerFS = document.getElementById('select-fs').value;

    if (!formDataHelper.validString(classroomNumber) ||
        !formDataHelper.validString(computerName) ||
        !formDataHelper.validString(computerIPAddress) ||
        !formDataHelper.validString(computerOS) ||
        !formDataHelper.validString(computerOS))
    {
        sweetAlert('Error on the form', 'You need to fill all the data.', 'error');
        return false;
    }

    swal({
        title: 'Are you sure to create this computer?',
        text: 'The computer is going to place at classroom ' + classroomNumber,
        type: 'info',
        showCancelButton: true,
        closeOnConfirm: false,
        showLoaderOnConfirm: true
    }, function() {
        var req = $.post({
            url: url,
            data: {
                "classroomNumber": classroomNumber,
                "computerName": computerName,
                "computerIPAddress": computerIPAddress,
                "osId": computerOS,
                "fsId": computerFS
            },
            dataType: "json"
        });
        req.done(function(data) {
            if (!data.success) {
                sweetAlert('Error in computer creation', data.error, 'error');
                return;
            }
            sweetAlert('Software Request sended', 'The computer was created for classroom ' + classroomNumber, 'success');
            $('.modal').modal('hide');
        });
        req.fail(function(err) {
            sweetAlert('Error in computer creation', 'Error creating the computer', 'error');
        });
    });

    return false;
};
