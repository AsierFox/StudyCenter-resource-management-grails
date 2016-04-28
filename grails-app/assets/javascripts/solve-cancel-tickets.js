
function refreshPage() {
    document.location = document.location.pathname;
}

function ticketChanged() {
    swal({
        title: 'Ticket status changed',
        text: 'The requested change was made',
        type: 'success',
        showLoaderOnConfirm: true
    }, function() {
        refreshPage();
    });
}

function showError(err) {
    sweetAlert('Error making the request', err ? err : 'The requested operation could not be resolved.', 'error');
}

function cancelTicket(ticketId, ticketSubject) {
    var requestURL = 'cancelTicket';

    swal({
        title: 'Cancel the ticket ' + ticketSubject + '?',
        text: 'You want to cancel this ticket?',
        type: 'info',
        showCancelButton: true,
        closeOnConfirm: false,
        showLoaderOnConfirm: true
    }, function() {
        var req = $.post({
            url: requestURL,
            data: { "ticketId": ticketId },
            dataType: "json"
        });
        req.done(function(data) {
            if (!data.success) {
                showError(data.error);
                return;
            }
            ticketChanged();
        });
        req.fail(function(err) {
            showError();
        });
    });

    return false;
}

function solveTicket(ticketId, ticketSubject) {
    var requestURL = 'solveTicket';

    swal({
        title: 'Solve the ticket ' + ticketSubject + '?',
        text: 'You want to solve this ticket?',
        type: 'info',
        showCancelButton: true,
        closeOnConfirm: false,
        showLoaderOnConfirm: true
    }, function() {
        var req = $.post({
            url: requestURL,
            data: { "ticketId": ticketId },
            dataType: "json"
        });
        req.done(function(data) {
            if (!data.success) {
                showError(data.error);
                return;
            }
            ticketChanged();
        });
        req.fail(function(err) {
            showError();
        });
    });

    return false;
}
