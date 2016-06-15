
function refreshPage() {
    document.location = document.location.pathname;
};

function deleteComputer(ipAddress) {
    swal({
        title: 'Are you sure you want to delete this computer?',
        type: 'info',
        showCancelButton: true,
        closeOnConfirm: false,
        showLoaderOnConfirm: true
    }, function() {
        $.ajax({
            url: "/computer/deleteComputer",
            method: "POST",
            data: { "ipAddress": ipAddress },
            dataType: "json",
            success: function(data) {
                if (!data.success) {
                    sweetAlert('Error deleting the computer', data.error, 'error');
                    return false;
                }
                swal({
                    title: 'The computer was deleted successfully!',
                    type: 'success',
                    showLoaderOnConfirm: true
                }, function() {
                    refreshPage();
                });
            }
        });
    });
};
