
function formatComputer(computerName) {
    swal({
        title: 'Format computer ' + computerName + '?',
        text: 'The software of the computer ' + computerName + ' will be completely deleted.',
        type: 'info',
        showCancelButton: true,
        closeOnConfirm: false,
        showLoaderOnConfirm: true
    }, function() {
        $.ajax({
            url: "/computer/formatComputer",
            method: "POST",
            data: { "computerName": computerName },
            dataType: "json",
            success: function(data) {
                if (data.success) {
                    swal({
                        title: 'The computer ' + computerName + ' was formated!',
                        type: 'success',
                        showLoaderOnConfirm: true
                    }, function() {
                        refreshPage();
                    });
                }
            },
            error: function(err) {
                sweetAlert('Error formating the computer', null, 'error');
            }
        });
    });

    return false;
}
